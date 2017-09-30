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

;%SDEPOIN^INT^1^59547,73889^0
SDEPOIN ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ANAUSE(NOMP,NODESC,EL,PLEIN,GLOBJ,REFPT,REFCOR) 
 N CR
 S CR=0
 G:$D(@GLOBJ@("PT",NOMP)) FANAUS
 
 
 I ERRMES=0 G AN2
 D POCLEPA^%VVIDEO
 S CR=$$MES^%VZEOUI($$^%QZCHW("Creation du point")_" P"_NOMP_" ?","O")
 D POCLEPA^%VVIDEO
 Q:'(CR) 0
AN2 D CREA^%SDEPOI2(NOMP,NODESC,PLEIN,"","",TEMPREF)
 
FANAUS S PT(REFPT)="P"_NOMP,REFPT=REFPT+1
 S COOR(REFCOR)="$$^%SDSCPT(""%POINT"_NOMP_""",""ABSCISSE"")"
 S COOR(REFCOR+1)="$$^%SDSCPT(""%POINT"_NOMP_""",""ORDONNEE"")"
 S REFCOR=REFCOR+2
 S @TEMPREF@("PAEI",EL,NOMP)=""
 I (ERRMES=0)!(PLEIN=1) S @TEMPREF@("PAE",NOMP,EL)="^^"_$S(CR:"D",1:"") Q 1
 S @TEMPREF@("PAE",NOMP,EL)=@PRES@(NODESC,"X")_"^"_@PRES@(NODESC,"Y")_"^"_$S(CR:"D",1:"")
 S @GLAFF@("C",NOMP,"X")=@PRES@(NODESC,"X")
 S @GLAFF@("C",NOMP,"Y")=@PRES@(NODESC,"Y")
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ELEM(EL,ANCNOM,NOMP,NODESC,PLEIN,GLOBJ,X,Y,MERR) 
 S MERR=""
 I ANCNOM="" G:'($D(@GLOBJ@("PT",NOMP))) ELEM1 S MERR=$$^%QZCHW("Le point")_" P"_NOMP_" "_$$^%QZCHW("existe deja") Q 0
 I '($D(@GLOBJ@("PAE",NOMP,ANCNOM))),$D(@GLOBJ@("PT",NOMP)) S MERR=$$^%QZCHW("Le point")_" P"_NOMP_" "_$$^%QZCHW("existe deja") Q 0
ELEM1 D CREA^%SDEPOI2(NOMP,NODESC,PLEIN,X,Y,TEMPREF)
 S @TEMPREF@("PAEI",EL,NOMP)=""
 I (ERRMES=0)!(PLEIN=1) S @TEMPREF@("PAE",NOMP,EL)="^^D" Q 1
 S @TEMPREF@("PAE",NOMP,EL)=@PRES@(NODESC,"X")_"^"_@PRES@(NODESC,"Y")_"^D"
 S @GLAFF@("C",NOMP,"X")=@PRES@(NODESC,"X")
 S @GLAFF@("C",NOMP,"Y")=@PRES@(NODESC,"Y")
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
SUPREFEL(GLOBJ,NOEL,FORC,PLEIN,TEMPREF,GLAFF) 
 N ELEM,PO,AEL
 S ELEM=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(ELEM)
 
 S PO=""
BOSUP S PO=$O(@GLOBJ@("PAEI",NOEL,PO))
 G:PO="" FBSUP
 G:((ERRMES=0)!(PLEIN=1))!$D(@TEMPREF@("PAE",PO)) BOSUP2
 S @GLAFF@("S",1,PO,"X")=$P(@GLOBJ@("PAE",PO,NOEL),"^")
 S @GLAFF@("S",1,PO,"Y")=$P(@GLOBJ@("PAE",PO,NOEL),"^",2)
BOSUP2 I $P(@GLOBJ@("PAE",PO,NOEL),"^",3)="D" S @ELEM@(PO)=""
 K @GLOBJ@("PAE",PO,NOEL)
 G BOSUP
 
FBSUP K @GLOBJ@("PAEI",NOEL)
 I FORC'=0 F %PO=0:0 S PO=$O(@ELEM@(PO)) Q:PO=""  I $ZP(@GLOBJ@("PAE",PO,"z"))="" D SUPPRPO
 K @(ELEM)
 Q
 
SUPPRPO 
 
 I (FORC>2)&$D(@TEMPREF@("PAE",PO)) K:((ERRMES=1)&(PLEIN=0))&$D(@GLAFF@("C",PO)) @GLAFF@("C",PO) Q
 S AEL=$ZP(@GLOBJ@("PAE",PO,"z"))
 I AEL'="" S:@GLOBJ@("EL",AEL,"TYPE")="POINT" AEL=$ZP(@GLOBJ@("PAE",PO,AEL)) Q:AEL'=""
 G:(FORC#2)=0 SUPPRP2
 
 I ERRMES=0 G SUPPR3
 D POCLEPA^%VVIDEO
 S TUE=$$MES^%VZEOUI($$^%QZCHW("Destruction du point")_" P"_PO_" ?","O")
 D POCLEPA^%VVIDEO
 Q:'(TUE)
SUPPRP2 
 G:PLEIN=1 SUPPR3
 S @GLAFF@("S",2,PO,"X")=@GLOBJ@("PTR",PO,"X")
 S @GLAFF@("S",2,PO,"Y")=@GLOBJ@("PTR",PO,"Y")
SUPPR3 K @GLOBJ@("PTR",PO)
 
 I '($D(@GLOBJ@("PT",PO,"NOEL"))) K @GLOBJ@("PT",PO) Q
 
 S NOOBJ=@GLOBJ@("PT",PO,"NOEL")
 
 K @GLOBJ@("EL",NOOBJ)
 K @GLCOMP@(NOOBJ)
 K @GLTEXT@(NOOBJ)
 K @GLOBJ@("PT",PO)
 Q

