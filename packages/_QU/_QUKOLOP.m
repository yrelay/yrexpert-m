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

;%QUKOLOP^INT^1^59547,73885^0
ZIMPRIME(GLO) 
 
 
 S NOPAGE=0,DEBUT=1,DATE=$$DATE^%QMDATE,HEURE=$$HEURE^%QMDATE,NBLMAX=^TABIDENT(WHOIS,"IMPRCOUR"),%PORT=^TABIDENT(WHOIS,"PRINTER")
 C %PORT O %PORT U %PORT
 S LIGNE=-1 F %LIGNE=0:0 S LIGNE=$N(@GLO@(LIGNE)) Q:(LIGNE=-1)!(LIGNE'?.N)  D TLIGNE
 W # C %PORT O $I U $I
 K DATE,DEBUT,HEURE,III,JJJ,LIGNE,%LIGNE,NBLIGNE,NBLMAX,NOPAGE,%PORT
 Q
TLIGNE I DEBUT D TETE
 S NBLIGNE=NBLIGNE+1 S:(NBLIGNE+5)>NBLMAX DEBUT=1
 W !,$$^%QZCHEV(@GLO@(LIGNE),@GLO@("LGC"),"P"),"   "
 F III=1:1 Q:'($D(@GLO@("COL",III)))  S JJJ=@GLO@("COL",III) W $S($D(@GLO@(LIGNE,$P(JJJ,"^",3))):$$^%QZCHEV(@GLO@(LIGNE,$P(JJJ,"^",3)),$P(JJJ,"^",2),"P"),1:$J("",$P(JJJ,"^",2))),"   "
 Q
TETE S NOPAGE=NOPAGE+1,DEBUT=0,NBLIGNE=1
 W #
 D CADR
 W !,!
 W $$^%QZCHEV(@GLO@("TITC"),@GLO@("LGC"),"P"),"   "
 F III=1:1 Q:'($D(@GLO@("COL",III)))  S JJJ=@GLO@("COL",III) W $$^%QZCHEV($P(JJJ,"^",1),$P(JJJ,"^",2),"P"),"   "
 W !,!
 S NBLIGNE=NBLIGNE+5 Q
CADR I $D(@GLO@("MSG")) W !,"Le ",DATE," a ",HEURE,?40,@GLO@("MSG"),?100,"Page ",NOPAGE S NBLIGNE=NBLIGNE+1 Q
 F III=1:1:@GLO@("SCAD") S JJJ=-1 F %JJJ=0:0 S JJJ=$N(@GLO@("CADR",III,JJJ)) Q:JJJ=-1  W !,@GLO@("CADR",III,JJJ) S NBLIGNE=NBLIGNE+1
 Q

