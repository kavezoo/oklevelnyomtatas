<?php
declare(strict_types=1);

use Migrations\BaseMigration;

class CreateSmokeTimerTables extends BaseMigration
{
    public function change(): void
    {
        $countries = $this->table('countries');
        $countries
            ->addColumn('access_id', 'integer', ['null' => false])
            ->addColumn('code', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('short_name_en', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('created', 'datetime', ['null' => false])
            ->addColumn('modified', 'datetime', ['null' => false])
            ->addIndex(['access_id'], ['unique' => true])
            ->create();

        $clubs = $this->table('clubs');
        $clubs
            ->addColumn('access_id', 'integer', ['null' => false])
            ->addColumn('name', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('country_id', 'integer', ['null' => true])
            ->addColumn('email1', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('email2', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('www', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('created', 'datetime', ['null' => false])
            ->addColumn('modified', 'datetime', ['null' => false])
            ->addIndex(['access_id'], ['unique' => true])
            ->addIndex(['country_id'])
            ->addForeignKey('country_id', 'countries', 'id', ['delete' => 'SET_NULL', 'update' => 'CASCADE'])
            ->create();

        $people = $this->table('people');
        $people
            ->addColumn('access_id', 'integer', ['null' => false])
            ->addColumn('first_name', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('last_name', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('club_id', 'integer', ['null' => true])
            ->addColumn('country_id', 'integer', ['null' => true])
            ->addColumn('gender_id', 'integer', ['null' => true])
            ->addColumn('phone', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('email1', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('email2', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('active', 'boolean', ['null' => false, 'default' => true])
            ->addColumn('created', 'datetime', ['null' => false])
            ->addColumn('modified', 'datetime', ['null' => false])
            ->addIndex(['access_id'], ['unique' => true])
            ->addIndex(['club_id'])
            ->addIndex(['country_id'])
            ->addForeignKey('club_id', 'clubs', 'id', ['delete' => 'SET_NULL', 'update' => 'CASCADE'])
            ->addForeignKey('country_id', 'countries', 'id', ['delete' => 'SET_NULL', 'update' => 'CASCADE'])
            ->create();

        $competitions = $this->table('competitions');
        $competitions
            ->addColumn('access_id', 'integer', ['null' => false])
            ->addColumn('name', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('subtitle', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('place', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('organizer', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('status', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('event_date', 'datetime', ['null' => true])
            ->addColumn('competition_start', 'datetime', ['null' => true])
            ->addColumn('competition_end', 'datetime', ['null' => true])
            ->addColumn('filling_start', 'datetime', ['null' => true])
            ->addColumn('pipe', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('tobacco', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('chief_referee', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('competition_director', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('person3', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('last_master_pc', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('diploma_name1', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('diploma_name2', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('diploma_name3', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('diploma_name4', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('diploma_role1', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('diploma_role2', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('diploma_role3', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('diploma_role4', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('diploma_text1', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('diploma_text2', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('teams_enabled', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('payment_tracking', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('tables_tracking', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('competition_active', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('competition_finished', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('registration_closed', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('auto_register', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('filling_active', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('filling_finished', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('preprinted_cards', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('world_class', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('max_registration_number', 'integer', ['null' => true])
            ->addColumn('max_competition_number', 'integer', ['null' => true])
            ->addColumn('team_num_min', 'integer', ['null' => true])
            ->addColumn('team_num_max', 'integer', ['null' => true])
            ->addColumn('team_num_eval', 'integer', ['null' => true])
            ->addColumn('competitor_card_type', 'integer', ['null' => true])
            ->addColumn('fee_currency', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('vl_individuals_id', 'integer', ['null' => true])
            ->addColumn('vl_teams_id', 'integer', ['null' => true])
            ->addColumn('vl_women_id', 'integer', ['null' => true])
            ->addColumn('published_competition_id', 'integer', ['null' => true])
            ->addColumn('logo_competition', 'binary', ['null' => true])
            ->addColumn('logo_club', 'binary', ['null' => true])
            ->addColumn('created', 'datetime', ['null' => false])
            ->addColumn('modified', 'datetime', ['null' => false])
            ->addIndex(['access_id'], ['unique' => true])
            ->create();

        $teams = $this->table('teams');
        $teams
            ->addColumn('access_id', 'integer', ['null' => false])
            ->addColumn('competition_id', 'integer', ['null' => true])
            ->addColumn('name', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('order_number', 'integer', ['null' => true])
            ->addColumn('is_qualified', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('final_rank', 'integer', ['null' => true])
            ->addColumn('result_time', 'datetime', ['null' => true])
            ->addColumn('contestant_c1', 'integer', ['null' => true])
            ->addColumn('contestant_c2', 'integer', ['null' => true])
            ->addColumn('contestant_c3', 'integer', ['null' => true])
            ->addColumn('created', 'datetime', ['null' => false])
            ->addColumn('modified', 'datetime', ['null' => false])
            ->addIndex(['access_id'], ['unique' => true])
            ->addIndex(['competition_id'])
            ->addForeignKey('competition_id', 'competitions', 'id', ['delete' => 'SET_NULL', 'update' => 'CASCADE'])
            ->create();

        $seatingTables = $this->table('seating_tables');
        $seatingTables
            ->addColumn('access_id', 'integer', ['null' => false])
            ->addColumn('competition_id', 'integer', ['null' => true])
            ->addColumn('number', 'integer', ['null' => true])
            ->addColumn('seat_count', 'integer', ['null' => true])
            ->addColumn('referee_fixed', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('created', 'datetime', ['null' => false])
            ->addColumn('modified', 'datetime', ['null' => false])
            ->addIndex(['access_id'], ['unique' => true])
            ->addIndex(['competition_id'])
            ->addForeignKey('competition_id', 'competitions', 'id', ['delete' => 'SET_NULL', 'update' => 'CASCADE'])
            ->create();

        $registrations = $this->table('registrations');
        $registrations
            ->addColumn('access_id', 'integer', ['null' => false])
            ->addColumn('competition_id', 'integer', ['null' => true])
            ->addColumn('person_id', 'integer', ['null' => true])
            ->addColumn('club_id', 'integer', ['null' => true])
            ->addColumn('country_id', 'integer', ['null' => true])
            ->addColumn('team_id', 'integer', ['null' => true])
            ->addColumn('registration_number', 'integer', ['null' => true])
            ->addColumn('competition_number', 'integer', ['null' => true])
            ->addColumn('table_number', 'integer', ['null' => true])
            ->addColumn('final_rank', 'integer', ['null' => true])
            ->addColumn('final_rank_women', 'integer', ['null' => true])
            ->addColumn('result_time', 'datetime', ['null' => true])
            ->addColumn('fee_amount', 'decimal', ['precision' => 12, 'scale' => 2, 'null' => true])
            ->addColumn('email', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('disqualification_reason', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('note1', 'text', ['null' => true])
            ->addColumn('note2', 'text', ['null' => true])
            ->addColumn('access_last_modified', 'datetime', ['null' => true])
            ->addColumn('disqualified', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('team_scored', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('team_qualified', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('team_top3', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('email_sent', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('expo', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('gala', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('payment_ok', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('presidents_dinner', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('present', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('finished', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('competing', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('created', 'datetime', ['null' => false])
            ->addColumn('modified', 'datetime', ['null' => false])
            ->addIndex(['access_id'], ['unique' => true])
            ->addIndex(['competition_id'])
            ->addIndex(['person_id'])
            ->addIndex(['club_id'])
            ->addIndex(['country_id'])
            ->addIndex(['team_id'])
            ->addForeignKey('competition_id', 'competitions', 'id', ['delete' => 'SET_NULL', 'update' => 'CASCADE'])
            ->addForeignKey('person_id', 'people', 'id', ['delete' => 'SET_NULL', 'update' => 'CASCADE'])
            ->addForeignKey('club_id', 'clubs', 'id', ['delete' => 'SET_NULL', 'update' => 'CASCADE'])
            ->addForeignKey('country_id', 'countries', 'id', ['delete' => 'SET_NULL', 'update' => 'CASCADE'])
            ->addForeignKey('team_id', 'teams', 'id', ['delete' => 'SET_NULL', 'update' => 'CASCADE'])
            ->create();

        $locks = $this->table('competition_locks');
        $locks
            ->addColumn('access_id', 'integer', ['null' => false])
            ->addColumn('competition_id', 'integer', ['null' => true])
            ->addColumn('max_team_number', 'integer', ['null' => true])
            ->addColumn('max_table_number', 'integer', ['null' => true])
            ->addColumn('max_registration_number', 'integer', ['null' => true])
            ->addColumn('max_competition_number', 'integer', ['null' => true])
            ->addColumn('created', 'datetime', ['null' => false])
            ->addColumn('modified', 'datetime', ['null' => false])
            ->addIndex(['access_id'], ['unique' => true])
            ->addIndex(['competition_id'])
            ->addForeignKey('competition_id', 'competitions', 'id', ['delete' => 'SET_NULL', 'update' => 'CASCADE'])
            ->create();

        $settings = $this->table('smoke_timer_settings');
        $settings
            ->addColumn('access_id', 'integer', ['null' => false])
            ->addColumn('database_id', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('db_version', 'string', ['limit' => 255, 'null' => true])
            ->addColumn('last_competition_access_id', 'integer', ['null' => true])
            ->addColumn('lock_registrations', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('use_translation', 'boolean', ['null' => false, 'default' => false])
            ->addColumn('created', 'datetime', ['null' => false])
            ->addColumn('modified', 'datetime', ['null' => false])
            ->addIndex(['access_id'], ['unique' => true])
            ->create();
    }
}