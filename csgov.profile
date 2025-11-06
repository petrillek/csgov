<?php

/**
 * @file
 * Enables modules and site configuration for a CSGOV site installation.
 */

use Drupal\Core\Form\FormStateInterface;

/**
 * Implements hook_install_tasks().
 */
function csgov_install_tasks(&$install_state) {
  $tasks = [
    'csgov_install_settings_form' => [
      'display_name' => t('CSGOV settings'),
      'type' => 'form',
      'function' => 'Drupal\csgov\Installer\Form\SettingsForm',
    ],
  ];

  if (!empty($install_state['parameters']['csgov_migrate'])) {
    $tasks['csgov_install_migrate_batch'] = [
      'display_name' => '- ' . t('Default content'),
      'type' => 'batch',
    ];
  }

  if (!empty($install_state['parameters']['csgov_guides'])) {
    $tasks['csgov_install_guides_batch'] = [
      'display_name' => '- ' . t('Guide documentation'),
      'type' => 'batch',
    ];
  }

  return $tasks;
}

/**
 * Implements hook_form_FORM_ID_alter() for install_configure_form().
 *
 * Allows the profile to alter the site configuration form.
 */
function csgov_form_install_configure_form_alter(&$form, FormStateInterface $form_state) {
  $form['site_information']['site_name']['#default_value'] = 'CSGOV Starterkit';
  $form['regional_settings']['site_default_country']['#default_value'] = 'CZ';
}

/**
 * Imports default content via a batch process during installation.
 *
 * @param $install_state
 *   An array of information about the current installation state.
 *
 * @return array|null
 *   The batch definition.
 */
function csgov_install_migrate_batch(&$install_state) {
  // Install dependencies of migrate scripts.
  \Drupal::service('module_installer')->install(['csgov_migrate']);
  // Set first migrated page as site front page.
  \Drupal::configFactory()->getEditable('system.site')
    ->set('page.front', '/node/1')->save(TRUE);
  // Process migrations.
  return _csgov_migrate_get_batch('import');
}

/**
 * Installs guide documentation module during installation.
 *
 * @param $install_state
 *   An array of information about the current installation state.
 *
 * @return array|null
 *   The batch definition.
 */
function csgov_install_guides_batch(&$install_state) {
  // Install the guides module which will automatically import guides via hook_install().
  \Drupal::service('module_installer')->install(['csgov_guides']);

  // Return empty batch since hook_install() handles the import.
  return [
    'title' => t('Installing guide documentation'),
    'operations' => [],
    'finished' => '_csgov_guides_install_finished',
  ];
}

/**
 * Batch finished callback for guide module installation.
 *
 * @param bool $success
 *   Whether the batch completed successfully.
 * @param array $results
 *   The results array.
 * @param array $operations
 *   The operations array.
 */
function _csgov_guides_install_finished($success, $results, $operations) {
  if ($success) {
    \Drupal::messenger()->addMessage(t('Guide documentation module has been installed.'));
  }
  else {
    \Drupal::messenger()->addError(t('An error occurred while installing the guide documentation module.'));
  }
}
