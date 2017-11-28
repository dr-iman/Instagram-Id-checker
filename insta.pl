#!/usr/bin/perl 
# Coded By : dr-iman
# Site : Guardiran.org



use URI::URL;
use LWP::UserAgent;
use Term::ANSIColor;
use IO::Socket::INET;
use HTTP::Request;
use HTTP::Request::Common qw(POST);
use HTTP::Request::Common qw(GET);

system(($^O eq 'MSWin32') ? 'cls' : 'clear');

$logo = "
 _______               __                                   
|_     _|.-----.-----.|  |_.---.-.-----.----.---.-.--------.
 _|   |_ |     |__ --||   _|  _  |  _  |   _|  _  |        |
|_______||__|__|_____||____|___._|___  |__| |___._|__|__|__|
                                 |_____|                    
 ______ __                __                                
|      |  |--.-----.----.|  |--.-----.----.                 
|   ---|     |  -__|  __||    <|  -__|   _|                 
|______|__|__|_____|____||__|__|_____|__|                   
                                           Coded By dr-iman ( Guardiran.org )                                                                                                     
";

print "$logo";

print "\n Select Method : 1-Single Search 2-Mass Search : ";
$method =<STDIN>;
chomp($method);

if ($method eq "1" or $method eq "Single Search")
{
print "\n Enter Username : ";
$sin=<STDIN>;
chomp($sin);
$url = "https://instagram.com/$sin/";
single();
}

elsif ($method eq "2" or $method eq "Mass Search")
{

print "\n Enter Your List : ";
my $list =<STDIN>;
chomp($list);
  open (THETARGET, "<$list") || die "[-] Can't open the Targets List !";
@TARGETS = <THETARGET>;
close THETARGET;
$link=$#TARGETS + 1;
foreach $ma(@TARGETS){

chomp($ma);

$url = "https://instagram.com/$ma/";
mass();
}
}




sub single($url){

$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
$ua->timeout (10);

my $single = $ua->get("$url")->content;

if ($single =~ /Page Not Found/)
{
print "\n This Id Is Available :) \n";
}
else
{
print "\n This Id Is Not Available :( \n";
}
}


sub mass($url){

$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
$ua->timeout (10);

my $mass = $ua->get("$url")->content;
if ($mass =~ /Page Not Found/)
{
print "\n This Id Is Available :) \n";
}
else
{
print "\n This Id Is Not Available :( \n";
}
}
