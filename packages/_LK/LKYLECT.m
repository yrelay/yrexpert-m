;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;LKYLECT^INT^1^59547,74868^0
LKYLECT ;
 
 
 
 
 
 N RET
 N B,C,END,I,LIM,N,REP
 D CLEPAG^%VVIDEO,^%EBCD1
 S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="LECTURE D'UNE BANDE OU D'UN FICHIER"
 D 4^%VZCD,SELSUP Q:IO=""
 I IO=47 D POCLEPA^%VVIDEO W $$^%QZCHW("Veuillez mettre la bande dans le lecteur ... [RETURN]") R *RET:^TOZE($I,"ATTENTE")
QUES D POCLEPA^%VVIDEO W $$^%QZCHW("Impression sur (E)cran ou (I)mprimante (CTRL A) ?") R *REP Q:REP=1  G QUES:REP<32 S REP=$C(REP) G:(REP'="I")&(REP'="E") QUES
 D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant ... lecture en cours")
 S LIM=$P(^[QUI]LKY("LONGUEUR"),"^",1)
 S END="" F I=1:1:LIM S END=END_"!"
 G @REP
E 
 I IO=47 C IO O IO:("EFL":LIM:8000) D LECTE C IO U 0
 I IO'=47 C IO O IO D LECTE C IO U 0
 D POCLEPA^%VVIDEO W $$^%QZCHW("Lecture terminee ("),N,$$^%QZCHW(") ... [RETURN]") R *RET:^TOZE($I,"ATTENTE")
 D POCLEPA^%VVIDEO Q
LECTE U IO W:IO=47 *-5 S STOP=0
 S N=0 F %J=0:0 D BLOCE Q:(B=END)!STOP
 U IO W:IO=47 *-5 Q
BLOCE I IO=47 U IO S B="" F I=1:1:LIM R *C S B=B_EBCDIC(C)
 I IO'=47 U IO S B="" R B
 U 0 S DX=0,DY=10 X XY W B
 S N=N+1,DX=0,DY=23 X XY W $$^%QZCHW("Nombre d'enregistrements lus = "),N
 R *RET:0 Q:RET'=1
STOPE D POCLEPA^%VVIDEO W $$^%QZCHW("Arret (O/N) ? [O] : ") R *RET:^TOZE($I,"ATTENTE")
 S:RET=-1 RET=1 F DY=1,6,13,78,79 G:RET=DY @RET
 D ^%VSQUEAK G STOPE
1 D POCLEPA^%VVIDEO Q
6 G 1
13 G 79
78 G 1
79 S STOP=1 G 1
I 
 S IMP=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0) O IMP
 I IO=47 C IO O IO:("EFL":LIM:8000) D LECTI C IO C IMP U 0
 I IO'=47 C IO O IO D LECTI C IO U 0
 D POCLEPA^%VVIDEO W $$^%QZCHW("Lecture terminee ("),N,$$^%QZCHW(") ... [RETURN]") R *RET:^TOZE($I,"ATTENTE")
 D POCLEPA^%VVIDEO Q
LECTI U IO W:IO=47 *-5 S STOP=0
 S N=0 U IMP W #,!,?30,$$^%QZCHW("LECTURE D'UNE BANDE"),!,! U IO
 F %J=0:0 D BLOCI Q:(B=END)!STOP
 U IO W:IO=47 *-5 Q
BLOCI I IO=47 U IO S B="" F I=1:1:LIM R *C S B=B_EBCDIC(C)
 I IO'=47 U IO S B="" R B
 U IMP W ?0,B,!
 S N=N+1,DX=0,DY=23 U 0 X XY W $$^%QZCHW("Nombre d'enregistrements lus = "),N
 U IMP R *RET:0 Q:RET'=1
STOPI U 0 D POCLEPA^%VVIDEO W $$^%QZCHW("Arret (O/N) ? [O] : ") R *RET:^TOZE($I,"ATTENTE")
 S:RET=-1 RET=1 F DY=1,6,13,78,79 G:RET=DY @("I"_RET)
 D ^%VSQUEAK G STOPI
I1 D POCLEPA^%VVIDEO U IMP Q
I6 G I1
I13 G I79
I78 G I1
I79 S STOP=1 G I1
SELSUP N SUP D POCLEPA^%VVIDEO S SUP=$$^%VZECH2($$^%QZCHW("Support choisi :"),$$^%QZCHW("BANDE"),$$^%QZCHW("FICHIER"))
 I SUP=$$^%QZCHW("BANDE") S IO=47 Q
 D POCLEPA^%VVIDEO S IO=$$^%VZAME1($$^%QZCHW("Nom du fichier : ")) Q
 ;

