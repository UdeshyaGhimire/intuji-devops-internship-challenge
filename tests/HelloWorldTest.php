<?php

/*
 * This file is part of Silarhi.
 * (c) Guillaume Sainthillier <hello@silarhi.fr>
 * This source file is subject to the MIT license that is bundled
 * with this source code in the file LICENSE.
 */

namespace Silarhi\Tests;

use PHPUnit\Framework\TestCase;
use Silarhi\Hello;

final class HelloWorldTest extends TestCase
{
    public function testHello()
    {
        $hello = new Hello();
        $contents = $hello->display();
        $this->assertEquals('Hello World vlatest', $contents);
    }
}
