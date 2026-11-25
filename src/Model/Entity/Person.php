<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

class Person extends Entity
{
    protected array $_accessible = [
        'access_id' => true,
        'first_name' => true,
        'last_name' => true,
        'club_id' => true,
        'country_id' => true,
        'gender_id' => true,
        'phone' => true,
        'email1' => true,
        'email2' => true,
        'active' => true,
        'created' => true,
        'modified' => true,
        'club' => true,
        'country' => true,
        'registrations' => true,
    ];
}