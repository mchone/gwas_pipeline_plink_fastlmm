#!usr/bin/perl
#this script could create multiple phenotype and tfam files base on their sub-population.
#eg. perl sub_split.pl phenotypes.txt list_533.txt
my($pht,$list)=@ARGV;
my $all="phenotypes_all";
my $japall="phenotypes_japall";
my $tej="phenotypes_tej";
my $trj="phenotypes_trj";
my $indall="phenotypes_indall";
my $indI="phenotypes_indI";
my $indII="phenotypes_indII";
my $aus="phenotypes_aus";

open DATA,"<$pht" or die ($!);
open LIST,"<$list" or die ($!);
open ALL,">$all" or die ($!);
open JAPALL,">$japall" or die ($!);
open TEJ,">$tej" or die ($!);
open TRJ,">$trj" or die ($!);
open INDALL,">$indall" or die ($!);
open INDI,">$indI" or die ($!);
open INDII,">$indII" or die ($!);
open AUS,">$aus" or die ($!);

@phnoty=<DATA>;
chomp(@phnoty);
close DATA;

@var=<LIST>;
chomp(@var);
close LIST;

for $py(@phnoty){
 next if $py!~/^[CW]/;
 @aaa = split(/\t/,$py);
 #shift @aaa; #use this when phenotypes.txt has 3 columns.
 my ($id,$pp) = @aaa;
 $py = $id."\t".$id."\t".$pp;
 for $mem(@var){
 my ($ld,$pop) = split(/\t/,$mem);
 if ($id eq $ld and $pop ne ""){
  print ALL $py."\n";
 if ($pop=~/Aus/){print AUS $py."\n";}
 if ($pop=~/J/){
  print JAPALL $py."\n";
  if ($pop eq "TeJ"){print TEJ $py."\n";}
  elsif ($pop eq "TrJ"){print TRJ $py."\n";}
}
 if ($pop=~/Ind/){
  print INDALL $py."\n";
  if ($pop eq "IndI"){print INDI $py."\n";}
  elsif ($pop eq "IndII"){print INDII $py."\n";}
}
}
}
}

my $tall="all.tfam";
my $tjapall="japall.tfam";
my $ttej="tej.tfam";
my $ttrj="trj.tfam";
my $tindall="indall.tfam";
my $tindI="indI.tfam";
my $tindII="indII.tfam";
my $taus="aus.tfam";

open ALL,"<$all" or die ($!);
open JAPALL,"<$japall" or die ($!);
open TEJ,"<$tej" or die ($!);
open TRJ,"<$trj" or die ($!);
open INDALL,"<$indall" or die ($!);
open INDI,"<$indI" or die ($!);
open INDII,"<$indII" or die ($!);
open AUS,"<$aus" or die ($!);

open TALL,">$tall" or die ($!);
open TJAPALL,">$tjapall" or die ($!);
open TTEJ,">$ttej" or die ($!);
open TTRJ,">$ttrj" or die ($!);
open TINDALL,">$tindall" or die ($!);
open TINDI,">$tindI" or die ($!);
open TINDII,">$tindII" or die ($!);
open TAUS,">$taus" or die ($!);

while (<ALL>){
 $td = (split(/\t/,$_))[0];
 print TALL $td."\t".$td."\t"."0"."\t"."0"."\t"."0"."\t"."0"."\n";
}
close ALL;
close TALL;

while (<JAPALL>){
 $td = (split(/\t/,$_))[0];
 print TJAPALL $td."\t".$td."\t"."0"."\t"."0"."\t"."0"."\t"."0"."\n";
}
close JAPALL;
close TJAPALL;

while (<TEJ>){
 $td = (split(/\t/,$_))[0];
 print TTEJ $td."\t".$td."\t"."0"."\t"."0"."\t"."0"."\t"."0"."\n";
}
close TEJ;
close TTEJ;

while (<TRJ>){
 $td = (split(/\t/,$_))[0];
 print TTRJ $td."\t".$td."\t"."0"."\t"."0"."\t"."0"."\t"."0"."\n";
}
close TRJ;
close TTRJ;

while (<INDALL>){
 $td = (split(/\t/,$_))[0];
 print TINDALL $td."\t".$td."\t"."0"."\t"."0"."\t"."0"."\t"."0"."\n";
}
close INDALL;
close TINDALL;

while (<INDI>){
 $td = (split(/\t/,$_))[0];
 print TINDI $td."\t".$td."\t"."0"."\t"."0"."\t"."0"."\t"."0"."\n";
}
close INDI;
close TINDI;

while (<INDII>){
 $td = (split(/\t/,$_))[0];
 print TINDII $td."\t".$td."\t"."0"."\t"."0"."\t"."0"."\t"."0"."\n";
}
close INDII;
close TINDII;

while (<AUS>){
 $td = (split(/\t/,$_))[0];
 print TAUS $td."\t".$td."\t"."0"."\t"."0"."\t"."0"."\t"."0"."\n";
}
close AUS;
close TAUS;
