<?php
declare(strict_types=1);

namespace App\Middleware;

use App\Utility\AccessUploadLimits;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\MiddlewareInterface;
use Psr\Http\Server\RequestHandlerInterface;

/**
 * Csak POST /import/upload — PHP limitek emelése, még a BodyParser előtt.
 */
class AccessFileUploadMiddleware implements MiddlewareInterface
{
    public function process(ServerRequestInterface $request, RequestHandlerInterface $handler): ResponseInterface
    {
        if ($request->getMethod() !== 'POST') {
            return $handler->handle($request);
        }

        $params = $request->getAttribute('params');
        if (!is_array($params)) {
            return $handler->handle($request);
        }

        $controller = strtolower((string)($params['controller'] ?? ''));
        $action = strtolower((string)($params['action'] ?? ''));

        if ($controller === 'import' && $action === 'upload') {
            AccessUploadLimits::applyForAccessUpload();
        }

        return $handler->handle($request);
    }
}