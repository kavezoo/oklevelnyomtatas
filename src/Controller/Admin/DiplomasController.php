<?php
declare(strict_types=1);

namespace App\Controller\Admin;

use App\Controller\DiplomasController as BaseDiplomasController;
use Cake\Event\EventInterface;

/**
 * Oklevelek — Admin prefix alatt ugyanaz a logika, mint a gyökér /diplomas.
 */
class DiplomasController extends BaseDiplomasController
{
    public function initialize(): void
    {
        parent::initialize();
        $this->viewBuilder()->setTemplatePath('Diplomas');
    }

    public function beforeRender(EventInterface $event): void
    {
        parent::beforeRender($event);
        $this->viewBuilder()->setTemplatePath('Diplomas');
    }
}