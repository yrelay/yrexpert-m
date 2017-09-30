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

;TONUMHAU^INT^1^59547,74873^0
TONUMHAU ;
 
 G @TYP
SUB S NUC=POSY-DELTA,NUT=NEW+DELTA
 S LIB2=POSENR(NEW),LLIB2=$L(LIB2),EFF2="" F UU=1:1:LLIB2 S EFF2=EFF2_" "
 S DY=NUT,DX=8 X XY W EFF2 S DX=40,DY=POSY X XY W LIB2 F UU=1:1:TEM S WW=""
 S NUP=PREM+1 F EE=1:1:NBX S LIBP=POSENR(NUP) D SDEC S NUP=NUP+1
 S DX=40,DY=POSY X XY W EFF2 S DX=8 X XY W LIB2 S POSENR(POSY-DELTA)=LIB2 F GG=1:1:TEM2 W ""
 G FIN
SDEC S EFFP="",LLIBP=$L(LIBP) F RE=1:1:LLIBP S EFFP=EFFP_" "
 S DX=8,DDY=NUP+DELTA,DY=DDY-1 X XY W LIBP S DY=DDY X XY W EFFP S INUP=NUP-1,POSENR(INUP)=LIBP F GG=1:1:TEM2 W ""
 G FIN
DEC S NBX=NBN-(POSY-DELTA),NBF=NEW,PREM=POSY-DELTA,POSZ=POSY F HH=1:1:NBF S NEW=POSZ-DELTA,POSY=NBN+DELTA D SUB
 G FIN
HAUT S NBX=(POSY-DELTA)-1,NBF=NEW,PREM=1 F HH=1:1:NBF S NEW=1 D SUB
 G FIN
FIN Q

