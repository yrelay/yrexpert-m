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
;! Nomprog     : %QS1CHLI                                                     !
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

%QS1CHLI(B) 
 
 
 
 
 
 
 N I,%I,L,%SELECT,LIS
 D ^%VZEATT
 ;HL2 S LIS=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(LIS)
 S LIS=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(LIS)
 S @LIS@("INTER")=1,@LIS@("MSG")=$$^%QZCHW("Choisissez une liste")
 S @LIS@("LGC")=12,@LIS@("TITC")=$$^%QZCHW("Liste")
 S @LIS@("MODI")=1
 S @LIS@("SELECT1")=1
 S @LIS@("COL",1)=$$^%QZCHW("Cardinal")_"^10^CARD"
 S @LIS@("COL",2)=$$^%QZCHW("Date")_"^10^DATE"
 S @LIS@("COL",3)=$$^%QZCHW("Heure")_"^10^%QMDAHEU"
 S @LIS@("COL",4)="^25^REQ"
 S @LIS@(1)=$$NOMLOG^%QSF(B)
 S L=1,I=""
 F %I=0:0 S I=$$NXTRI^%QSTRUC8("L0",I) Q:I=""  I $$^%QSCALVA("L0",I,"BASE")=B D TI
 S COL=LIS
 D ^%QUKOLO
 K @(LIS)
 Q %SELECT
 
TI 
 S L=L+1
 S @LIS@(L)=I,@LIS@(L,"CARD")=$$^%QSCALVA("L0",I,"CARD")
 S @LIS@(L,"DATE")=$$^%QSCALVA("L0",I,"DATE.CREATION")
 S @LIS@(L,"HEURE")=$$^%QSCALVA("L0",I,"HEURE.CREATION")
 S @LIS@(L,"REQ")=$$^%QSCALVA("L0",I,"AUTRE")
 Q

