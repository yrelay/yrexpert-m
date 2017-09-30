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

;%SDCCMS^INT^1^59547,73888^0
SDCCMS ;
 
 
 
 
 
 
 
 
 
DUP 
 N %C,%R,COL,DUP,PK,TIT,VDUP,VERS,X,Y
 S TIT=$$^%QZCHW("Duplication d'une collection")
DSO 
 D ^%SDCOL(TIT_" ("_$$^%QZCHW("collection a dupliquer")_")",1,.DUP,.VDUP)
 
 I DUP="" Q
 
 D ^%SDCOL(TIT_" ("_$$^%QZCHW("collection a creer")_")",0,.COL,.VERS)
 I COL="" G DSO
 K PK
 
 D GLOCOP^%QCAGLC($$DEF(DUP,VDUP),$$DEF(COL,VERS))
 
 D EXT^%SDCDEF(COL,VERS,1,1)
 G DSO
 
 
SUP 
 N %C,%R,COL,PK,STO,VERS,X,Y
SUD 
 D ^%SDCOL($$^%QZCHW("Suppression d'une collection"),1,.COL,.VERS)
 
 I COL="" Q
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez-vous la suppression de cette collection"))=1 D SUPPR(COL,VERS)
 G SUD
 
 
 
SUPPR(COL,VERS) 
 N NOBJ,OBJ,VO,STO
 
 S STO=$$DEF^%SDCCMS(COL,VERS)
 S NOBJ=""
 F %I=0:0 S NOBJ=$O(@STO@("OBJ",NOBJ)) Q:NOBJ=""  S OBJ=$O(@STO@("OBJ",NOBJ,"R","")),VO=$O(@STO@("OBJ",NOBJ,"R",OBJ,"")) K ^[QUI]SDOBJ(OBJ,VO,"COL",COL,VERS)
 
 K @(STO)
 Q
 
SUPOBJ(COL,VERS,OBJ,VOBJ) 
 N NOB,VO,OBJC,STO
 S STO=$$DEF^%SDCCMS(COL,VERS)
 
 S NOB=""
SUPO2 S NOB=$O(@STO@("OBJ",NOB)) Q:NOB=""
 S OBJC=$O(@STO@("OBJ",NOB,"R",""))
 I OBJC'=OBJ G SUPO2
 S VO=$O(@STO@("OBJ",NOB,"R",OBJC,""))
 I VO'=VOBJ G SUPO2
 K @STO@("OBJ",NOB)
 G SUPO2
 
RETOBJ(COL,VERS,NUM) 
 N STO
 S STO=$$DEF^%SDCCMS(COL,VERS)
 K @STO@("OBJ",NUM)
 
 D MAJPT(COL,VERS)
 Q
 
AJOBJ(COL,VERS,NUM,OBJ,VO,X0,Y0,ANG,ECH) 
 
 N STO
 S STO=$$DEF^%SDCCMS(COL,VERS)
 
 I NUM="" S NUM=$ZP(@STO@("OBJ",""))+1
 S @STO@("OBJ",NUM,"R",OBJ,VO)=""
 S @STO@("OBJ",NUM,"ECH")=ECH,@STO@("OBJ",NUM,"ANG")=ANG
 S @STO@("OBJ",NUM,"X")=X0,@STO@("OBJ",NUM,"Y")=Y0
 
 D MAJPT(COL,VERS)
 Q
 
MAJPT(COL,VERS) 
 N ADR,NOBJ,NPT,OBJ,VO,XP,YP,STO,TAB
 S STO=$$DEF^%SDCCMS(COL,VERS)
 
 S TAB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB") K @(TAB)
 
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(STO,"PT"),$$CONCAS^%QZCHAD(TAB,"VAL"))
 K @STO@("PT")
 
 S NOBJ=""
INPO S NOBJ=$O(@STO@("OBJ",NOBJ))
 I NOBJ="" K @(TAB) Q
 
 S OBJ=$O(@STO@("OBJ",NOBJ,"R","")),VO=$O(@STO@("OBJ",NOBJ,"R",OBJ,""))
 
 S ADR=$$CONCAS^%QZCHAD($$DEF^%SDOCMS(OBJ,VO),"PT")
 
 S NPT=""
INPP S NPT=$O(@ADR@(NPT))
 I NPT="" G INPO
 I $D(@TAB@("EXI",NPT)) G INPP
 S XP=$S($D(@TAB@("VAL",NPT,"X")):@TAB@("VAL",NPT,"X"),1:"")
 S YP=$S($D(@TAB@("VAL",NPT,"Y")):@TAB@("VAL",NPT,"Y"),1:"")
 I XP="",@ADR@(NPT)="A" S XP=@ADR@(NPT,"X"),YP=@ADR@(NPT,"Y")
 S @STO@("PT",NPT,"X")=XP,@STO@("PT",NPT,"Y")=YP
 S @TAB@("EXI",NPT)=""
 G INPP
 
POINT(COL,VERS,NPT,X,Y) 
 N STO
 S STO=$$DEF^%SDCCMS(COL,VERS)
 S @STO@("PT",NPT,"X")=X,@STO@("PT",NPT,"Y")=Y
 Q
 
 
 
DEF(C,V) 
 N A
 S A=$$CONCAT^%QZCHAD("^[QUI]SDCOL",$S($$NUM^%QZNBN(C):C,1:""""_C_""""))
 S A=$$CONCAT^%QZCHAD(A,$S($$NUM^%QZNBN(V):V,1:""""_V_""""))
 Q A
 
 
EXI(C,V) 
 I (C="")!(V="") Q 0
 N A
 S A=$$DEF(C,V)
 I $D(@A) Q 1
 Q 0
 
EXOBJ(C,V,N) 
 I ((C="")!(V=""))!(N="") Q 0
 N A
 S A=$$DEF(C,V)
 I '($D(@A@("OBJ",N))) Q 0
 Q 1
 
EXPT(C,V,PT) 
 I ((C="")!(C=""))!(PT="") Q 0
 N A
 S A=$$DEF(C,V)
 I '($D(@A@("PT",PT))) Q 0
 Q 1

