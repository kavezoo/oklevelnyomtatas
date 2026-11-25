<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

class Country extends Entity
{
    protected array $_accessible = [
        'access_id' => true,
        'code' => true,
        'short_name_en' => true,
        'created' => true,
        'modified' => true,
        'clubs' => true,
        'people' => true,
        'registrations' => true,
    ];
}