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

;%TXODRV^INT^1^59547,74031^0
%TXODRV ;
 
 
 
 
 N ADR,DNAI,RRR,SRDV,X1,OO,UC,COM,PRENO,OBJ,XCH,HORDV,SX,SY,TEMP
 D HRV^%TXINDH
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TRDV") K @(TEMP) S DX=0,DY=17 D CLEBAS^%VVIDEO,LISRDV^%TXAFFS
 D POCLEPA^%VVIDEO W $$^%QZCHW("Tapez CTRLA pour sortir ou M sur le rendez-vous a modifier")
LIS S DX=0,DY=19,NXI=-1,NXS=80,NYI=18,NYS=24,MPASX=20,MPASY=1 X XY
 S %SEL=$$^%QUCHOIX(TEMP,1,"",7,17,60,5) G 77:%SEL'="" Q
 
1 Q
77 S RESUL(1)=%POSTE,RESUL(2)=TAD,RESUL(3)=HRDV,%RS=%RS(%SEL)
 S RESUL(4)=$P(%SEL,"|",4),RESUL(5)=$P(%SEL,"|",5),RESUL(6)=$P(%RS,"^",1),RESUL(7)=$P(%RS,"^",2),RESUL(8)=$P(%RS,"^",3),RESUL(9)=$P(%SEL,"|",6),RESUL(10)=$P(%SEL,"|",7),RESUL(11)=$P(%RS,"^",4)
 D ^%VACTGRQ("IFRDV",.RESUL),STO G LIS
 Q
STO ;;
 ;; stockage
 K @NOMTAB@(RESUL(4),RESUL(5),RESUL(9),RESUL(10))
 S @NOMTAB@(RESUL(4),RESUL(5),RESUL(9),RESUL(10))=@%RESUL
 ;

