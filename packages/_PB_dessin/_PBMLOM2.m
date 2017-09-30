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

;%PBMLOM2^INT^1^59547,73873^0
PTYXP2 ;
 
 S:'($D(%TYPLOGO)) %TYPLOGO=3 S:'($D(%Z)) %Z=1 S:'($D(%9X)) %9X=0 S:'($D(%COUL)) %COUL=0 S %FONC="FT" K %9N,%9D,%9T D ^%PBPZ S %FONC="LT" K %9N,%9P D ^%PBPZ S XXX=%9X,YYY=%9Y D TRIA,RECT,LETR D:%LIBEL LIBEL K XXX,YYY,%9LXY1,%9LXY2,%9LXY3 Q
LIBEL I %COUL S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 S %FONC="MOUV",%9X=XXX-(25*%Z),%9Y=YYY-(140*%Z) D ^%PBPZ
 I %INCLIN S %FONC="INCLIN",%9TA=25E-2 D ^%PBPZ
 S %FONC="TAILLE",%9MOD=%Z D ^%PBPZ
 S %FONC="TEXT",%9STR="INFORMATIQUE" D ^%PBPZ
 I %INCLIN S %FONC="INCLIN" K %9TA D ^%PBPZ
 S %FONC="TAILLE",%9MOD=1/%Z D ^%PBPZ
 Q
LETR S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 S %9X=XXX,%9Y=YYY,%FONC="MOUV" D ^%PBPZ
 S %FONC="PM",%9N=0 D ^%PBPZ
 S %FONC="LBREL"
 S %9LXY1=(24*%Z)_","_(-51*%Z)_","_(66*%Z)_","_(64*%Z)_","_(28*%Z)_","_(-65*%Z)_","_(47*%Z)_","_(50*%Z)_","_(6*%Z)_","_(-57*%Z)_","_(52*%Z)_","_(18*%Z)_","
 S %9LXY2=(22*%Z)_","_(147*%Z)_","_(-38*%Z)_","_(5*%Z)_","_(-51*%Z)_","_(-43*%Z)_","_(-9*%Z)_","_(47*%Z)_","_(-39*%Z)_","
 S %9LXY3=(0*%Z)_","_(-108*%Z)_","_(-115*%Z),%9LXY=%9LXY1_%9LXY2_%9LXY3
 D ^%PBPZ
 S %FONC="PM",%9N=2 D ^%PBPZ
 S %FONC="EP" D ^%PBPZ I %TYPLOGO=1 S %FONC="LT" K %9N,%9P D ^%PBPZ S %FONC="FT" K %9N,%9D,%9T D ^%PBPZ S %FONC="FP" D ^%PBPZ
 S %FONC="MOUV",%9X=XXX+(255*%Z),%9Y=YYY-(40*%Z) D ^%PBPZ
 S %FONC="PM",%9N=0 D ^%PBPZ
 S %FONC="LBREL",%9LXY1=(32*%Z)_","_(-16*%Z)_","_(33*%Z)_","_(36*%Z)_","_(15*%Z)_","_(-40*%Z)_","_(28*%Z)_","_(0*%Z)_","_(117*%Z)_","_(166*%Z)_","_(-63*%Z)_","_(0*%Z)_","_(-46*%Z)_","_(-53*%Z)
 S %9LXY2=","_(-3*%Z)_","_(30*%Z)_","_(-29*%Z)_","_(0*%Z)_","_(-24*%Z)_","_(-39*%Z)_","_(0*%Z)_","_(72*%Z)_","_(-49*%Z)_","_(0*%Z)_","_(-11*%Z)_","_(-156*%Z)
 S %9LXY=%9LXY1_%9LXY2 D ^%PBPZ
 S %FONC="PM",%9N=2 D ^%PBPZ
 S %FONC="EP" D ^%PBPZ I %TYPLOGO=1 S %FONC="FP" D ^%PBPZ
 S %FONC="MOUV",%9X=XXX+(407*%Z),%9Y=YYY-(28*%Z) D ^%PBPZ
 S %FONC="PM",%9N=0 D ^%PBPZ
 S %FONC="LBREL",%9LXY1=(34*%Z)_","_(-23*%Z)_","_(60*%Z)_","_(58*%Z)_","_(-4*%Z)_","_(-44*%Z)_","_(43*%Z)_","_(-6*%Z)_","_(28*%Z)_","_(44*%Z)_","_(-5*%Z)_","_(-43*%Z)_","_(49*%Z)_","_(0*%Z)
 S %9LXY2=","_(54*%Z)_","_(123*%Z)_","_(-32*%Z)_","_(35*%Z)_","_(-77*%Z)_","_(-68*%Z)_","_(-14*%Z)_","_(56*%Z)_","_(-39*%Z)_","_(-6*%Z)_","_(-97*%Z)_","_(-126*%Z)
 S %9LXY=%9LXY1_%9LXY2 D ^%PBPZ
 S %FONC="PM",%9N=2 D ^%PBPZ
 S %FONC="EP" D ^%PBPZ I %TYPLOGO=1 S %FONC="FP" D ^%PBPZ
 Q
TRIA S %FONC="CRAYON"
 I %COUL S %9TC="FEUTRE",%9CL="ROUGE"
 E  S %9TC="FEUTRE",%9CL="NOIR"
 D ^%PBPZ
 S %FONC="MOUV",%9X=XXX+(146*%Z),%9Y=YYY+(429*%Z) D ^%PBPZ
 S %FONC="PM",%9N=0 D ^%PBPZ
 S %FONC="LBREL",%9LXY=(82*%Z)_","_(-246*%Z)_","_(104*%Z)_","_(246*%Z)_","_(-186*%Z)_","_(0*%Z) D ^%PBPZ
 S %FONC="PM",%9N=2 D ^%PBPZ
 S %FONC="EP" D ^%PBPZ I (%TYPLOGO=1)!(%TYPLOGO=2) S %FONC="FP" D ^%PBPZ
 S %FONC="MOUV",%9X=XXX+(332*%Z),%9Y=YYY+(429*%Z) D ^%PBPZ
 S %FONC="PM",%9N=0 D ^%PBPZ
 S %FONC="LBREL",%9LXY=(106*%Z)_","_(-246*%Z)_","_(76*%Z)_","_(246*%Z)_","_(-182*%Z)_","_(0*%Z) D ^%PBPZ
 S %FONC="PM",%9N=2 D ^%PBPZ
 S %FONC="EP" D ^%PBPZ I (%TYPLOGO=1)!(%TYPLOGO=2) S %FONC="FP" D ^%PBPZ
 Q
RECT S %FONC="CRAYON",%9TC="PLUME",%9CL="NOIR" D ^%PBPZ
 S %FONC="MOUV",%9X=XXX+(134*%Z),%9Y=YYY+(279*%Z) D ^%PBPZ
 S %FONC="PM",%9N=0 D ^%PBPZ
 I %TYPLOGO=1 S %FONC="LBREL",%9LXY=(0*%Z)_","_(-151*%Z)_","_0_","_(-83*%Z)_","_(189*%Z)_","_0_","_0_","_(85*%Z)_","_(0*%Z)_","_(154*%Z)_","_(-91*%Z)_","_(-110*%Z)_","_(-98*%Z)_","_(110*%Z) D ^%PBPZ
 I (%TYPLOGO=2)!(%TYPLOGO=3) S %FONC="LBREL",%9LXY=(0*%Z)_","_(-151*%Z)_","_(25*%Z)_","_(0*%Z)_","_(0*%Z)_","_(-31*%Z)_","_(43*%Z)_","_(28*%Z)_","_(121*%Z)_","_(0*%Z)_","_(0*%Z)_","_(154*%Z)_","_(-91*%Z)_","_(-110*%Z)_","_(-98*%Z)_","_(110*%Z) D ^%PBPZ
 S %FONC="PM",%9N=2 D ^%PBPZ
 S %FONC="EP" D ^%PBPZ
 I (%TYPLOGO=1)!(%TYPLOGO=2) S %FONC="LT",%9N=1,%9P=$S(%Z<4:1E-1,1:3E-1) D ^%PBPZ S %FONC="FT",%9N=3,%9D=20,%9T=45 D ^%PBPZ S %FONC="FP" D ^%PBPZ S %FONC="LT" K %9N,%9P D ^%PBPZ
 S %FONC="MOUV",%9X=XXX+(346*%Z),%9Y=YYY+(279*%Z) D ^%PBPZ
 S %FONC="PM",%9N=0 D ^%PBPZ
 I %TYPLOGO=1 S %FONC="LBREL",%9LXY=(0*%Z)_","_(-188*%Z)_","_0_","_(-48*%Z)_","_(186*%Z)_","_0_","_0_","_(79*%Z)_","_(0*%Z)_","_(159*%Z)_","_(-92*%Z)_","_(-110*%Z)_","_(-94*%Z)_","_(110*%Z) D ^%PBPZ
 I (%TYPLOGO=2)!(%TYPLOGO=3) S %FONC="LBREL",%9LXY=(0*%Z)_","_(-188*%Z)_","_(27*%Z)_","_(0*%Z)_","_(0*%Z)_","_(-21*%Z)_","_(39*%Z)_","_(50*%Z)_","_(120*%Z)_","_(0*%Z)_","_(0*%Z)_","_(159*%Z)_","_(-92*%Z)_","_(-110*%Z)_","_(-94*%Z)_","_(110*%Z) D ^%PBPZ
 S %FONC="PM",%9N=2 D ^%PBPZ
 S %FONC="EP" D ^%PBPZ
 I (%TYPLOGO=1)!(%TYPLOGO=2) S %FONC="LT",%9N=1,%9P=$S(%Z<4:1E-1,1:3E-1) D ^%PBPZ S %FONC="FT",%9N=3,%9D=20,%9T=45 D ^%PBPZ S %FONC="FP" D ^%PBPZ S %FONC="LT" K %9N,%9P D ^%PBPZ
 Q
TEST 
 W !,"CE PROGRAMME EST DESTINE A DESSINER LE LOGO YXP "
 W !,!,"PORTE TABLE TRACANTE [TXB3:]: " R %PORT S:%PORT="" %PORT="TXB3:" S PORTE=%PORT
 W !,"TYPE DE TABLE TRACANTE (RD-GL/RD-GL2) [RD-GL2]: " R %TERM S:%TERM="" %TERM="RD-GL2"
 C PORTE O PORTE S %FONC="INIT" D ^%PBPZ
DESSIN W !,!,"VOULEZ-VOUS DESSINER LE LOGO YXP ? (O/N) [O]: " R REP G:(REP'="O")&(REP'="") FIN
 W !,"TYPE DE LOGO  COMPLETEMENT REMPLI --> 1"
 W !,"              A MOITIE     REMPLI --> 2"
 W !,"              NON          REMPLI --> 3"
 W !,"TYPE DE LOGO (1/2/3) [3]:" R %TYPLOGO S:%TYPLOGO="" %TYPLOGO=3
 W !,"LE VOULEZ-VOUS EN COULEUR ? (O/N) [O]: " R %COUL S:%COUL="" %COUL="O" S %COUL=%COUL="O"
 W !,"POSITION SUR LA FEUILLE"
 W !,"DE 0 A 4096 EN X    --->  X = [0] " R %9X S:%9X="" %9X=0
 W !,"DE 0 A 3120 EN Y    --->  Y = [0] " R %9Y S:%9Y="" %9Y=0
 W !,"ECHELLE DU DESSIN [1]: " R %Z S:%Z="" %Z=1
 W !,"VOULEZ-VOUS LE LIBELLE ""INFORMATIQUE"" SOUS LE LOGO (O/N) ? [O] " R %LIBEL S:%LIBEL="" %LIBEL="O" S %LIBEL=%LIBEL="O"
 I %LIBEL W !,"LE VOULEZ-VOUS EN ITALIQUE (O/N) ? [O] " R %INCLIN S:%INCLIN="" %INCLIN="O" S %INCLIN=%INCLIN="O"
 D ^%PBMLOM G DESSIN
FIN C PORTE K REP,%FONC,%PORT,%TERM,%TYPLOGO,%9X,%9Y Q

