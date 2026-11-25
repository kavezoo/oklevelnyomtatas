<?php
declare(strict_types=1);

namespace App\Controller;

use App\Controller\Admin\RegistrationsController as AdminRegistrationsController;
use Cake\Event\EventInterface;

/**
 * Versenyregisztrációk szerkesztése — nyilvános URL: /registrations (nincs /admin).
 */
class RegistrationsController extends AdminRegistrationsController
{
    public function initialize(): void
    {
        parent::initialize();
        $this->viewBuilder()->setTemplatePath('Admin' . DS . 'Registrations');
    }

    public function beforeRender(EventInterface $event): void
    {
        parent::beforeRender($event);
        $this->viewBuilder()->setTemplatePath('Admin' . DS . 'Registrations');
    }
}