# Compilers

## About
This is a Docker image with installed compilers, interpreters, and [sandbox](https://github.com/ioi/isolate). It is used as a base image for [Judge0](https://github.com/judge0/judge0).

## Get Started
You can [host it yourself](https://github.com/judge0/judge0/blob/master/CHANGELOG.md#deployment-procedure).


## Supported Languages
<table>
<thead>
<tr>
<th style="text-align:center">#</th>
<th style="text-align:center">Name</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:center">1</td>
<td style="text-align:center"> NodeJS (20.12.2)</td>
</tr>
<tr>
<td style="text-align:center">2</td>
<td style="text-align:center">TypeScript (5.4.5)</td>
</tr>
<tr>
<td style="text-align:center">3</td>
<td style="text-align:center">Ruby (2.7.0)</td>
</tr>
</tbody>
</table>

## Sandbox
For sandbox judge0 is using [Isolate](https://github.com/ioi/isolate) (licensed under [GPL v2](https://github.com/ioi/isolate/blob/master/LICENSE)).

>Isolate is a sandbox built to safely run untrusted executables, offering them a limited-access environment and preventing them from affecting the host system. It takes advantage of features specific to the Linux kernel, like namespaces and control groups.

Huge thanks to [Martin Mareš](https://github.com/gollux) and [Bernard Blackham](https://github.com/bblackham) for developing and maintaining Isolate. Thanks to all [contributors](https://github.com/ioi/isolate/graphs/contributors) for their contributions to Isolate project.

Isolate was used as a sandbox environment (part of [CMS](https://github.com/cms-dev/cms) system) on big programming contests like [International Olympiad in Informatics](http://www.ioinformatics.org/index.shtml) (a.k.a. IOI) in 2012, and we trust that it works and does its job.

## Donate
Your are more than welcome to support original Judge0 developers on [Patreon](https://www.patreon.com/hermanzdosilovic), via [PayPal](https://paypal.me/hermanzdosilovic) or [Revolut](https://pay.revolut.com/profile/hermancy5).
