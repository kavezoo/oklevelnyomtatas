<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Table;
use Cake\Validation\Validator;

class ClubsTable extends Table
{
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('clubs');
        $this->setDisplayField('name');
        $this->setPrimaryKey('id');

        $this->addBehavior('Timestamp');

        $this->belongsTo('Countries', ['foreignKey' => 'country_id']);
        $this->hasMany('People', ['foreignKey' => 'club_id']);
        $this->hasMany('Registrations', ['foreignKey' => 'club_id']);
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