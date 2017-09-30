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

;%SDCDEF^INT^1^59547,73888^0
SDCDEF ;
 
 
 
 
 I '($$EXIST^%SDXGEN) D ^%VZEAVT($$^%QZCHW("environnement d'exploitation non defini")) Q
 N %C,%R,COL,EXI,PK,VERS,X,Y
DEB 
 D ^%SDCOL($$^%QZCHW("Definition d'une collection"),2,.COL,.VERS)
 
 I COL="" Q
 K PK
 D POCLEPA^%VVIDEO
 
 I $$EXI^%SDCCMS(COL,VERS) S EXI=1 G DEF
 
 D ^%VSQUEAK
 I $$MES^%VZEOUI($$^%QZCHW("Collection inexistante, voulez-vous la creer")_" ? ","N")'=1 G DEB
 S EXI=0
DEF D EXT(COL,VERS,EXI,1)
 G DEB
 
 
 
 
 
 
 
 
 
EXT(COL,VERS,EXI,MODOBJ) 
 N %R,%C,PK,X,Y
 N ADRO,ADRP,CTR,GLO,GLP,INIGLO,INIGLP,LISOB,LISPT,PTOBJ,STO,TEMP,TOBJ
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 
 S STO=$$DEF^%SDCCMS(COL,VERS)
 
 D FEN^%SDCDEFI,INIT
 S (INIGLP,INIGLO)=1
AFF 
 D CLEPAG^%VVIDEO,NORM^%VVIDEO,^%VZCDB($$^%QZCHW("Definition de la collection")_" "_COL,0)
 
 I EXI=0 G CARAC
 
 D ^%SDCOCAR(COL,VERS,1)
 
 D INOB^%SDCDEFI
 D AFFICH^%QUOLST2(GLO)
 
 D INPT^%SDCDEFI
 D AFFICH^%QUOLST2(GLP)
MEN 
 S EXI=1
 K Y
 S Y="10\BLH\5\\\caracteristiques,objets,points,interpretation,individus"
 D ^%PKPOP
 I (CTR="A")!(CTR="F") G FIN
 I CTR="R" G AFF
 I CTR'="" G MEN
 
 I X=2 G OBJET
 
 I X=3 G POINT
 
 I X=4 G INTER
 
 I X=5 G REPERT
 
CARAC 
 D ^%SDCOCAR(COL,VERS,0)
 G MEN
 
OBJET D INOB^%SDCDEFI
 D ^%QUOLST(GLO)
 G MEN
 
POINT D INPT^%SDCDEFI
 D ^%QUOLST(GLP)
 G MEN
 
REPERT D ^%QSGBASE
 G AFF
 
INTER D SAUV,SCENE^%SDSCENE(COL,VERS,0)
 G AFF
 
FIN 
 D SAUV
 K @(TEMP) I $D(PTOBJ) K @(PTOBJ)
 Q
 
SAUV 
 
 
 
 
 N %L,%V,CO,L,NUM,NOBJ,OBJ,VO,TABREF
 
 K @(ADRP)
 S L=""
 F %L=0:0 S L=$O(@LISPT@(L)) Q:L=""  S CO=@LISPT@(L),NUM=$P(CO,"^",1),@ADRP@(NUM,"X")=$P(CO,"^",2),@ADRP@(NUM,"Y")=$P(CO,"^",3)
 
 S OBJ=""
 F %L=0:0 S OBJ=$O(@TOBJ@(OBJ)) Q:OBJ=""  S VO="" F %V=0:0 S VO=$O(@TOBJ@(OBJ,VO)) Q:VO=""  K ^[QUI]SDOBJ(OBJ,VO,"COL",COL,VERS)
 
 S TABREF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TABREF") K @(TABREF)
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(STO,"IND"),$$CONCAS^%QZCHAD(TABREF,"IND"))
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(STO,"VAR"),$$CONCAS^%QZCHAD(TABREF,"VAR"))
 K @STO@("IND"),@STO@("VAR")
 
 S NOBJ=""
SAU2 S NOBJ=$O(@ADRO@(NOBJ))
 I NOBJ="" G FSAUV
 
 S OBJ=$O(@ADRO@(NOBJ,"R","")),VO=$O(@ADRO@(NOBJ,"R",OBJ,""))
 S ^[QUI]SDOBJ(OBJ,VO,"COL",COL,VERS)=""
 D VARIND
 G SAU2
FSAUV 
 I $D(@TABREF@("IND","@")) S @STO@("IND","@","BA")=@TABREF@("IND","@","BA"),@STO@("IND","@","O")=@TABREF@("IND","@","O")
 K @(TABREF) Q
 
VARIND 
 N AD,V
 S V="",AD=$$DEF^%SDOCMS(OBJ,VO)
VAR S V=$O(@AD@("VAR",V)) I V="" G IND
 I $D(@STO@("VAR",V)) G VAR
 S @STO@("VAR",V)=$S($D(@TABREF@("VAR",V)):@TABREF@("VAR",V),1:"")
 G VAR
IND S V=$O(@AD@("IND",V)) I V="" Q
 I $D(@STO@("IND",V)) G IND
 S @STO@("IND",V,"BA")=$S($D(@TABREF@("IND",V,"BA")):@TABREF@("IND",V,"BA"),1:"")
 S @STO@("IND",V,"O")=$S($D(@TABREF@("IND",V,"O")):@TABREF@("IND",V,"O"),1:"")
 G IND
 
INIT 
 N NOBJ,OBJ,VO
 S TOBJ=$$CONCAS^%QZCHAD(TEMP,"OBJVERS")
 S NOBJ=""
INI2 S NOBJ=$O(@ADRO@(NOBJ))
 I NOBJ="" Q
 
 S OBJ=$O(@ADRO@(NOBJ,"R","")),VO=$O(@ADRO@(NOBJ,"R",OBJ,""))
 S @TOBJ@(OBJ,VO)=""
 G INI2

