<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

class Club extends Entity
{
    protected array $_accessible = [
        'access_id' => true,
        'name' => true,
        'country_id' => true,
        'email1' => true,
        'email2' => true,
        'www' => true,
        'created' => true,
        'modified' => true,
        'country' => true,
        'people' => true,
        'registrations' => true,
    ];
}