<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Table;
use Cake\Validation\Validator;

class PeopleTable extends Table
{
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('people');
        $this->setDisplayField('last_name');
        $this->setPrimaryKey('id');

        $this->addBehavior('Timestamp');

        $this->belongsTo('Clubs', ['foreignKey' => 'club_id']);
        $this->belongsTo('Countries', ['foreignKey' => 'country_id']);
        $this->hasMany('Registrations', ['foreignKey' => 'person_id']);
    }

    public function validationDefault(Validator $validator): Validator
    {
        $validator
            ->scalar('last_name')
            ->maxLength('last_name', 255)
            ->allowEmptyString('last_name');

        $validator
            ->scalar('first_name')
            ->maxLength('first_name', 255)
            ->allowEmptyString('first_name');

        $validator
            ->integer('access_id')
            ->allowEmptyString('access_id')
            ->add('access_id', 'unique', ['rule' => 'validateUnique', 'provider' => 'table']);

        return $validator;
    }
}