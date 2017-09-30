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

;%QS0DEHI^INT^1^59547,73879^0
QS0DEHI(HISTO) 
 
 
 
 
 
 
 Q:((ATTTOT="")!(ATTLIS=""))!(LISTE="")
 D ^%VZEATT
 
 S NBC=1
 S @HISTO@("TEXT",1)=$$^%QZCHW("Le : ")_$$DATE^%QMDATE_$$^%QZCHW(" a ")_$$HEURE^%QMDATE
 S @HISTO@("TEXT",2)=$$^%QZCHW("Liste : ")_LISTE_" "_$S($$^%QSCALVA("L0",LISTE,"SOURCE")="REQUETES":"("_$$^%QSCALVA("L0",LISTE,"AUTRE")_")",1:"")
 S @HISTO@("TEXT",3)=$$^%QZCHW("Attribut de totalisation : ")_ATTTOT
 S @HISTO@("TEXT",4)=$$^%QZCHW("Attribut de regroupement : ")_ATTLIS
 S L=$$^%QSCALVA("L0",LISTE,"ADRESSE")
 S %U7=$$^%QSCALVA("L0",LISTE,"BASE")
 S NT=0,O=""
 F %O=0:0 S O=$O(@L@(O)) Q:O=""  S NT=NT+1 W:(NT#100)=0 "%" D TO
 G:NULIS SREM
 S NC=1
 S SVAL="" F %SVAL=0:0 S SVAL=$O(SVAL(SVAL)) Q:SVAL=""  D TSVAL S NC=NC+1
SREM S I="",MAX=0,NBCOL=0
BMAX S I=$O(@HISTO@("COL",I)) G:I="" FMAX
 S:@HISTO@("COL",I)>MAX MAX=@HISTO@("COL",I) S NBCOL=NBCOL+1
 G BMAX
FMAX S @HISTO@("HAUTEUR-MAX")=MAX,@HISTO@("NBCOL")=$S(NULIS:((BORNS-BORNI)\INTERV)+(((BORNS-BORNI)#INTERV)'=0),1:NBCOL)
 G:'(NULIS) FCOM S COL=1
BCOM G:COL>@HISTO@("NBCOL") FCOM
 S:'($D(@HISTO@("COL",COL))) @HISTO@("COL",COL)=0,@HISTO@("COL",COL,"TEXT")=((COL-1)*INTERV)+BORNI S COL=COL+1
 G BCOM
FCOM K ARBA,NBC,COL,HEURE,I,I1,MAX,MINUT,NBCOL,NC,NT,SV,SVAL,SVAL2,%SVAL,%ATTR,%EXIST,%OBJ,%VAL Q
 
TO S %OBJ=O,%ATTR=ATTLIS D VALATT Q:'(%EXIST)
 Q:NULIS&((%VAL<BORNI)!(%VAL'<BORNS))
 I '(NULIS) S %CH1=%VAL,%CH2=BORNI D ^%QZCHCO Q:('(%EG))&('(%SUP))  S %CH1=%VAL,%CH2=BORNS D ^%QZCHCO Q:%EG!%SUP
 S SVAL=%VAL,%ATTR=ATTTOT D VALATT Q:'(%EXIST)
 I NULIS S COL=((SVAL-BORNI)\INTERV)+1
 E  S:'($D(SVAL(SVAL))) SVAL(SVAL)=NBC,SVAL2(NBC)=SVAL,NBC=NBC+1 S COL=SVAL(SVAL)
 I '($D(@HISTO@("COL",COL))) S:'(NULIS) @HISTO@("COL",COL,"TEXT")=SVAL S:NULIS @HISTO@("COL",COL,"TEXT")=(((SVAL-BORNI)\INTERV)*INTERV)+BORNI S @HISTO@("COL",COL)=0
 S @HISTO@("COL",COL)=@HISTO@("COL",COL)+%VAL
 Q
 
VALATT S %VAL=$$^%QSCALVA(%U7,%OBJ,%ATTR),%EXIST=%VAL'="" Q
TSVAL S SV=SVAL(SVAL),SAVE=@HISTO@("COL",SV),@HISTO@("COL",SV)=@HISTO@("COL",NC),@HISTO@("COL",NC)=SAVE,SAVE=@HISTO@("COL",SV,"TEXT"),@HISTO@("COL",SV,"TEXT")=@HISTO@("COL",NC,"TEXT"),@HISTO@("COL",NC,"TEXT")=SAVE
 S SVAL(SVAL)=NC,SVAL(SVAL2(NC))=SV,SVAL2(SV)=SVAL2(NC),SVAL2(NC)=SVAL Q

