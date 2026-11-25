<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Table;
use Cake\Validation\Validator;

class CountriesTable extends Table
{
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('countries');
        $this->setDisplayField('code');
        $this->setPrimaryKey('id');

        $this->addBehavior('Timestamp');

        $this->hasMany('Clubs', ['foreignKey' => 'country_id']);
        $this->hasMany('People', ['foreignKey' => 'country_id']);
        $this->hasMany('Registrations', ['foreignKey' => 'country_id']);
    }

    public function validationDefault(Validator $validator): Validator
    {
        $validator
            ->integer('access_id')
            ->requirePresence('access_id', 'create')
            ->notEmptyString('access_id')
            ->add('access_id', 'unique', ['rule' => 'validateUnique', 'provider' => 'table']);

        return $validator;
    }
}