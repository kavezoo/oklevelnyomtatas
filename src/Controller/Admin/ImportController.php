<?php
declare(strict_types=1);

namespace App\Controller\Admin;

use App\Controller\ImportController as BaseImportController;
use Cake\Event\EventInterface;

/**
 * Access import — Admin prefix alatt ugyanaz a logika, mint /import.
 */
class ImportController extends BaseImportController
{
    public function initialize(): void
    {
        parent::initialize();
        $this->viewBuilder()->setTemplatePath('Import');
    }

    public function beforeRender(EventInterface $event): void
    {
        parent::beforeRender($event);
        $this->viewBuilder()->setTemplatePath('Import');
    }
}