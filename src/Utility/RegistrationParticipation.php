<?php
declare(strict_types=1);

namespace App\Utility;

use App\Model\Entity\Registration;

/**
 * Versenyen ténylegesen indulót jelöl (regisztrált, de nem induló = false).
 */
class RegistrationParticipation
{
    public static function competedInEvent(Registration $registration): bool
    {
        if ($registration->disqualified) {
            return false;
        }

        if (CompetitionTimeFormatter::toSeconds($registration->result_time) > 0) {
            return true;
        }

        return $registration->finished
            && $registration->final_rank !== null
            && (int)$registration->final_rank > 0;
    }
}