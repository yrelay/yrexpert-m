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

;%QUAPA4M^INT^1^59547,73884^0
QUAPA4M ;
 
 
 
 
 
 D POCLEPA^%VVIDEO
 I $$MES^%VZEOUI($$^%QZCHW("impression papier")_" ? ","O")'=1 D POCLEPA^%VVIDEO Q
 D ^%VZEATT
 N %O,%PORT,AD,BAI,CARD,COL,DAT,DEBP,DEP,HEUR,I,L,MSG,NBL,NOML,NP,NPAG
 N O,OBJ,P,SAVI,SYN,T,TEMP,V,Z
 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S Z=^Z($J)
 S NOML=$S($D(^Z($J,Z,"LIS")):^Z($J,Z,"LIS"),1:"")
 S DAT=$$DATE^%QMDATE,HEUR=$$HEURE^%QMDATE
 S CARD=$$^%QSCALVA("L0",NOML,"CARD")
 S BAI=^Z($J,Z,"B"),OBJ=$$NOMLOG^%QSF(BAI)
 
 S SYN=$S(($D(^Z($J,Z,"SYN"))#10)=0:0,1:^Z($J,Z,"SYN"))
 I SYN=1 S SYN("A")=$S(($D(^Z($J,Z,"SYN.A"))#10)=0:"",1:^Z($J,Z,"SYN.A")) I SYN("A")="" S SYN=0
 I SYN=1 S SYN("O")=$S(($D(^Z($J,Z,"SYN.O"))#10)=0:"",1:^Z($J,Z,"SYN.O"))
 S T=^Z($J,Z,"T")
 
 S COL=^Z($J,Z,"DEP")
 S P=^Z($J,Z,"LR")+2,NPAG=1
 F I=COL:1 Q:'($D(^Z($J,Z,"C",I)))  S E=(76-P)-1,E2=^Z($J,Z,"C",I,"L"),E=$S(E2>E:E,1:E2) D COL S P=(P+E)+1 I P'<76 S P=^Z($J,Z,"LR")+2,NPAG=NPAG+1
 
 S %PORT=$$TABID^%INCOIN("PRINTER")
 S NBL=$$TABID^%INCOIN("IMPRCOUR")-5
 
 S AD=^Z($J,Z,"A")
 S MSG=$$^%QZCHW("preparation des donnees")
 D MSG^%VZEATT(MSG) S DX=$L(MSG)
 
 S O=^Z($J,Z,"P",^Z($J,Z,"P"))
 S L=6,NPAG=0
 
 F %O=0:0 Q:O=""  S V=$S(T:@A@(O),1:O) D CARU S O=$O(@AD@(O))
 D MSG^%VZEATT($$^%QZCHW("impression en cours"))
 
 S SAVI=$I
 C %PORT O %PORT U %PORT
 D IMPRI^%QAX(SAVI)
 S NPAG=""
 F %O=0:0 S NPAG=$O(@TEMP@("IMP",NPAG)) Q:NPAG=""  S V="" D TETE,TO
 W #
 C %PORT
 U 0 D ^%VZEAVT($$^%QZCHW("impression terminee"))
 K @(TEMP)
 Q
 
TO 
 S V=$O(@TEMP@("IMP",NPAG,V)) I V="" Q
 W !
 S DEP=^Z($J,Z,"LR")+1
 
 S I=@TEMP@("IMP",NPAG,V)
 W $$CAR^%QZCHEV($S(SYN=1:$$^%QAXT(BAI,I,SYN("A"),SYN("O")),1:$$S^%QAX(I)),DEP-1,"P",",")," "
 S COL=""
 F %O=0:0 S COL=$O(@TEMP@("IMP",NPAG,V,COL)) Q:COL=""  S LA=^Z($J,Z,"C",COL,"L") W ?DEP,@TEMP@("IMP",NPAG,V,COL)," " S DEP=(DEP+LA)+1
 G TO
 
TETE 
 W #,!,$$^%QZCHW("le")," ",DAT," ",$$^%QZCHW("a")," ",HEUR
 W:NOML'="" ?30,$$^%QZCHW("liste")," : ",NOML W ?65,$$^%QZCHW("page")," : ",NPAG
 W !,?30 I CARD'="" W "(",CARD," ",OBJ,")"
 W !,!
 
 S DEP=^Z($J,Z,"LR")+1
 S COL=""
 S NP=@TEMP@("PAGE",NPAG)
 F %O=0:0 S COL=$O(@TEMP@("COL",NP,COL)) Q:COL=""  W ?DEP,@TEMP@("TITRE",COL)," " S DEP=(DEP+@TEMP@("COL",NP,COL,"L"))+1
 W !
 Q
 
COL 
 S @TEMP@("COL",NPAG,I,"L")=E2
 S @TEMP@("COL",NPAG,I,"C")=^Z($J,Z,"C",I,"C")
 I $D(^Z($J,Z,"C",I,"T")),^Z($J,Z,"C",I,"T")'="" S @TEMP@("TITRE",I)=$E(^Z($J,Z,"C",I,"T"),1,E)
 S @TEMP@("COL",NPAG,I,"I")=$S(($D(^Z($J,Z,"C",I,"I"))#10)=0:"",1:^Z($J,Z,"C",I,"I"))
 S @TEMP@("COL",NPAG,I,"D")=^Z($J,Z,"C",I,"D")
 Q
 
CARU 
 N UNIT,ATT,D,E,E2,I,OR,P
 S DX=DX+1 I DX>79 D MSG^%VZEATT(MSG) S DX=$L(MSG)+1
 X XY W "."
 S P=^Z($J,Z,"LR")+2
 S NP=0
CARP 
 S NP=NP+1
 I '($D(@TEMP@("COL",NP))) G FCAR
 S NPAG=NPAG+1
 S @TEMP@("PAGE",NPAG)=NP
 S COL=""
CARC 
 S COL=$O(@TEMP@("COL",NP,COL))
 I COL="" G CARP
 S E=(76-P)-1,E2=@TEMP@("COL",NP,COL,"L"),E=$S(E2>E:E,1:E2)
 S ATT=@TEMP@("COL",NP,COL,"C"),OR=@TEMP@("COL",NP,COL,"I")
 
 D CARVU
 S P=(P+E)+1
 I P'<76 S P=^Z($J,Z,"LR")+2
 G CARC
CARVU 
 S UNIT=$$UNIT^%LXSTOCK(ATT)
 I UNIT'="" S E=E-6
 S D=@TEMP@("COL",NP,COL,"D")
 I D=0 S LIB=$S(OR'="":$$^%QSCALIN(BAI,V,ATT,OR),1:$$^%QSCALVA(BAI,V,ATT)) G FAF
 I D=1 S LIB=$$AFFI^%QMDAUC(BAI,ATT,$$^%QSCALIN(BAI,V,ATT,OR)) G FAF
 N VT1,C
 
 S VT1=^Z($J,Z,"C",COL,"FCT.VT"),C=ATT
 S @("LIB="_^Z($J,Z,"C",COL,"FCT"))
FAF 
 S LIB=$$^%QZCHEV(LIB,E,"P")
 I UNIT'="" S LIB=LIB_" "_UNIT,E=E+6
 S @TEMP@("IMP",NPAG,L)=V
 S @TEMP@("IMP",NPAG,L,COL)=LIB
 Q
FCAR S L=L+1
 
 I L'<NBL S L=6 Q
 S NPAG=(NPAG-NP)+1
 Q

