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

;%PSSABUT^INT^1^59547,73874^0
%PSSABUT(GLODEF,GLOCOMP) ;;07:08 PM  28 Nov 1991;
 
 
 
 
 N DEF,LC
 S LC=1
 S DEF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DEF") K @(DEF)
 S @DEF@("GLODEF")=GLODEF,@DEF@("GLOCOMP")=GLOCOMP
 D CLEPAG^%VVIDEO,CADR
 D ^%QULIMO(0,3,80,8,GLODEF,.LC,"ADDCOND^%PSSABUT","SUPCOND^%PSSABUT")
 
FIN Q
REAFFI 
 N DEF,GLODEF,GLOCOMP
 S DEF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DEF")
 S GLODEF=@DEF@("GLODEF"),GLOCOMP=@DEF@("GLOCOMP")
 D CLEPAG^%VVIDEO,CADR
 D REAFF^%QULIMO3(1,1,GLODEF,0,3,80,8)
 Q
 D A18^%QULIMO4
 D REAFF^%AN7
 Q
 
CADR D ^%VZCD(0,79,0,2,0,0,"BUT")
 D CARSP^%VVIDEO(0,3,8,80,0)
 S DX=38,DY=3 X XY W $$^%QZCHW(" Conditions que doit remplir l'individu ")
 Q
 
 
ADDCOND 
 N POSIT,RA,SAVY1,SX,SY,NOCOMPIL,ATTD,APPD,APPEX,%PROVEN
 N %COMPIL,%COMP1,%COMP2,%COMP3,%COMP4,%COMP5,CH,NORES,P,RESULT,TEMPO
 N DEF,GLODEF,GLOCOMP
 S DEF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DEF")
 S GLODEF=@DEF@("GLODEF"),GLOCOMP=@DEF@("GLOCOMP")
 K ^SANAREQ($J) S ^NAVARACT($J)=1,NOCOMPIL=0
 S (ATTD,APPD,APPEX)=0,%PROVEN="GPS"
 S SAVY1=Y1,SX=DX,SY=DY,(POSIT,P)=1
 D INIT^%AN7(SX,SY)
 S RA=$$VAL^%QULIMO("TETE") D:RA'="" KILL^%ANA(RA)
 D INIT^%ANGEPIL
 S CH=Y1,RESULT=1,NORES=0,TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"AS")
 
 I $E(CH)=":" D AFF^%AN7(":") S %COMPIL=";" G SUIT2
 
 S %COMPIL="I ("
 K @(TEMPO) D EMPV^%ANGEPIL(TEMPO),EMPIL^%ANGEPIL("SUIT0^%PSSABUT")
 G COND^%AN4
SUIT0 
 D END^%AN7,EPIL^%ANGEPIL K @(TEMPO),^NAVARACT($J)
 S %COMPIL=%COMPIL_") S EXP=1"
SUIT2 S OK=RESULT
 I '(OK) D ^%VSQUEAK G FINAC
 S @GLOCOMP@(P1C)=%COMPIL
FINAC D KILL^%ANA(NORES)
 S Y1=SAVY1,DX=SX,DY=SY
 Q
 
 
SUPCOND 
 N RA
 N DEF,GLODEF,GLOCOMP
 S DEF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DEF")
 S GLODEF=@DEF@("GLODEF"),GLOCOMP=@DEF@("GLOCOMP")
 K @GLOCOMP@(P1C)
 S RA=$$VAL^%QULIMO("TETE") D:RA'="" KILL^%ANA(RA)
 S OK=1 Q
 ;

