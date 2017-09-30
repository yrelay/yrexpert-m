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

;%SDEPOI2^INT^1^59547,73889^0
SDEPOI2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DEPEND(NOMP,NODESC,MAITRE,XE,YE,EL,ANCNOM,PLEIN,GLOBJ,XS,YS,MERR) 
 N CR
 S MERR="",CR=0
 
 I $D(@GLOBJ@("PT",NOMP)) Q:'($$VERIF(NOMP,MAITRE,.CR,.MERR)) 0 G DEP1
 I ANCNOM="" G DEP0
DEP0 I ERRMES=0 S CR=1 G DEP1
 D POCLEPA^%VVIDEO
 S CR=$$MES^%VZEOUI($$^%QZCHW("Creation du point")_" P"_NOMP_" ?","O")
 D POCLEPA^%VVIDEO
 Q:'(CR) 0
DEP1 D CREA(NOMP,NODESC,PLEIN,XE,YE,GLOBJ)
 
 S XS="$$^%SDSCPT(""%POINT"_NOMP_""",""ABSCISSE"")"
 S YS="$$^%SDSCPT(""%POINT"_NOMP_""",""ORDONNEE"")"
 S @TEMPREF@("PAEI",EL,NOMP)=""
 I (ERRMES=0)!(PLEIN=1) S @TEMPREF@("PAE",NOMP,EL)="^^"_$S(CR:"D",1:"") Q 1
 S @TEMPREF@("PAE",NOMP,EL)=@PRES@(NODESC,"X")_"^"_@PRES@(NODESC,"Y")_"^"_$S(CR:"D",1:"")
 S @GLAFF@("C",NOMP,"X")=@PRES@(NODESC,"X")
 S @GLAFF@("C",NOMP,"Y")=@PRES@(NODESC,"Y")
 Q 1
 
 
 
 
 
 
 
 
 
VERIF(NOMP,MAITRE,CR,MERR) 
 N CH,NOMP2,POS,POS2
 I @GLOBJ@("PT",NOMP)'="C" Q 1
 S CH=@GLOBJ@("PT",NOMP,"X")
 S POS=$F(CH,"%POINT")
 I POS=0 S CR=0 Q 1
 F POS2=POS+1:1 Q:$E(CH,POS2+1)=","
 S NOMP2=$E(CH,POS,POS2-1)
 I MAITRE=("P"_NOMP2) S CR=0 Q 1
 S MERR=$$^%QZCHW("Le point")_" P"_NOMP_" "_$$^%QZCHW("depend deja du point")_" P"_NOMP2
 S CR=1
 Q 0
 
 
 
 
 
 
 
 
 
 
 
CREA(NOMP,NODESC,PLEIN,X,Y,TEMPREF) 
 
 S @TEMPREF@("PT",NOMP,"X")=X
 S @TEMPREF@("PT",NOMP,"Y")=Y
 S @TEMPREF@("PT",NOMP)=$S((X="")&(Y=""):"",((X+0)=X)&((Y+0)=Y):"A",1:"C")
 
 Q:'(ERRMES)
 Q:PLEIN
 S @TEMPREF@("PTR",NOMP,"X")=@PRES@(NODESC,"X")
 S @TEMPREF@("PTR",NOMP,"Y")=@PRES@(NODESC,"Y")
 Q
 
 
 
 
 
 
 
PTELEM(TEMPREF) 
 N NOMPT,NOMEL,%COMPIL,CX,CY
 I '($D(VIS)) S VIS="""INVISIBLE"""
 I '($D(EPAIS)) S EPAIS=1
 S NOMPT=""
BCREL S NOMPT=$O(@TEMPREF@("PT",NOMPT))
 Q:NOMPT=""
 L @(GLOBJ)
 S NOMEL=$ZP(@GLOBJ@("EL","z"))+1
 S @GLOBJ@("EL",NOMEL)=""
 L
 S @TEMPREF@("PT",NOMPT,"NOEL")=NOMEL
 S CX=@TEMPREF@("PT",NOMPT,"X")
 S CY=@TEMPREF@("PT",NOMPT,"Y")
 I CX="",(ERRMES=1)&(PLEI=0) S CX=@TEMPREF@("PTR",NOMPT,"X")
 I CY="",(ERRMES=1)&(PLEI=0) S CY=@TEMPREF@("PTR",NOMPT,"Y")
 S @GLOBJ@("EL",NOMEL,"SYNT")=NOMEL_$C(0)_EPAIS_$C(0)_VIS_$C(0)_CX_$C(0)_CY_$C(0)_"P"_NOMPT
 S @GLOBJ@("EL",NOMEL,"TYPE")=$$^%QZCHW("POINT")
 
 S @GLCOMP@(NOMEL,0)="S EPAISSEUR="_EPAIS_",VISIBLE=$S($$^%QZCHW("_VIS_")=""INVISIBLE"":0,1:1)"
 S @GLCOMP@(NOMEL,1)="S AD=$$^%SDSCPT(""%POINT"_NOMPT_""",""ABSCISSE"")"
 S @GLCOMP@(NOMEL,2)="S OD=$$^%SDSCPT(""%POINT"_NOMPT_""",""ORDONNEE"")"
 S @GLCOMP@(NOMEL,3)="S TEXTE=""P"_NOMPT_""" X ^%ENVIRON(""SD"",""POINT"")"
 
 S @GLTEXT@(NOMEL)=NOMEL_" ; POINT ; P"_NOMPT_" ; "_EPAIS_" ; "_VIS_$S((CX="")&(CY=""):"",1:" ; ( "_CX_" ; "_CY_" )")
 S @GLOBJ@("PAE",NOMPT,NOMEL)=@TEMPREF@("PT",NOMPT,"X")_"^"_@TEMPREF@("PT",NOMPT,"Y")_"^"
 S @GLOBJ@("PAEI",NOMEL,NOMPT)=""
 G BCREL

