#!/usr/bin/perl

# Script to submit FootPrints incidents to LeanKit Kanban

require HTTP::Request;
require LWP::UserAgent;

use strict;
use warnings;

# BoardID from LeanKit
my $boardid = 33696023;
# LaneID from LeanKit
my $laneid = 33736329;
my $authentication = 'Basic bGVhbmtpdC1hcGlAcGUuZ2F0ZWNoLmVkdTpRbThqZ2thbnM2';
my $server = 'gtpe.leankitkanban.com';
my $uri = "http://$server/Kanban/Api/Board/$boardid/AddCard/Lane/$laneid/Position/0";

my $title = "FootPrints Incident via Perl #$$";
my $description = 'Globally parallel task intermandated schemas after magnetic core competencies. Seamlessly benchmark equity invested intellectual capital rather than resource sucking strategic.';
my $json = "{ 'Title': \"$title\", 'Description': \"$description\", 'TypeId': 33732759, 'Priority': 1, 'Size': 0, 'IsBlocked': false, 'ExternalSystemName': 'GT ServiceDesk', 'ExternalSystemUrl': 'http://servicedesk.gatech.edu/', 'ExternalCardID': $$ }";

my $req = HTTP::Request->new( 'POST', $uri );
$req->header( Authorization => $authentication );
$req->header( 'Content-Type' => 'application/json' );
$req->content( $json );

my $lwp = LWP::UserAgent->new;
my $response = $lwp->request( $req );
if ($response->is_success) {
   print $response->decoded_content;  # or whatever
} else {
  die $response->status_line;
}
