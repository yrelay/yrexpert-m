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

;%QULELZ^INT^1^59576,27864^0
%QULELZ ;;05:51 PM  20 May 1992; ; 06 Apr 93  1:57 PM
 
 
 
 
 
 
 
 
TEST 
 N TEMP,G,R,U,TITRE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TEST") K @(TEMP)
 S G=$$CONCAS^%QZCHAD(TEMP,"X")
 S R=$$CONCAS^%QZCHAD(TEMP,"R")
 S U=$$CONCAS^%QZCHAD(TEMP,"U")
 S @U@("AUTRE",1)="XXX^%QULELZ",@U@("AUTRE",1,"TXT")="CTRB",@U@("AUTRE",1,"COM")="Texte de CTRB",@U@("AUTRE",1,"CTR")="B"
 S @U@("AFF")="$$ABRV^%QULELZ"
 S @U@("CUT")="XXX^%QULELZ",@U@("CUT","CTR")="P"
 S @U@("PASTE")="XXX^%QULELZ",@U@("PASTE","CTR")="D"
 S @U@("GOTO")=""
 S @G@("aaaaaaa","bbbbb")=""
 S @G@("bbbbb","cccccc")=""
 S @G@("bbbbb","cdddd")=""
 S @G@("cccccc","dddd")=""
 S @G@("cccccc","eeeee")=""
 S @G@("eeeee","xxce")=""
 S @G@("eeeee","yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyce")=""
 S @G@("zzz","eeeee")=""
 S @G@("zzrrr","zzttt")="",@G@("zzttt","zzrrr")=""
 S TITRE="1"_$C(0)_"1"_$C(0)_"essai"_$C(0)_"1"_$C(0)_"20"_$C(0)_"de"_$C(0)_"2"_$C(0)_"21"_$C(0)_"titre"
 D ^%QULELU(G,G,5,3,U,TITRE)
 K @(TEMP)
 Q
XXX(x,y,z) Q
 
 
 
ABRV(RIVX,LG) N GAG S GAG=@RIVX Q GAG
 
GAMMES 
 N TEMP,G,A,%A,B,%B,C,%C,GA,O,%O,D,%D
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GAM") K @(TEMP)
 S G=$$CONCAS^%QZCHAD(TEMP,"G")
 S PILE=$$CONCAS^%QZCHAD(TEMP,"P")
 S UCONT=$$CONCAS^%QZCHAD(TEMP,"U")
 S A="" F %K=0:0 S A=$O(^[QUI]QUERYV("ARTICLE",A)) Q:A=""  I $D(^[QUI]QUERYV("ARTICLE",A,"GAMME.MOZART")) S O="" F %O=0:0 S O=$O(^[QUI]QUERYV("ARTICLE",A,"GAMME.MOZART",O)) Q:O=""  S B=^[QUI]QUERYV("ARTICLE",A,"GAMME.MOZART",O) D SUITE
 S @UCONT@("AFF")="$$GAMAFF^%QULELZ"
 S @UCONT@("AUTRE",1)="GAMCTRB^%QULELZ"
 S @UCONT@("AUTRE",1,"TXT")="Individu"
 S @UCONT@("AUTRE",1,"COM")="Visualisation des attributs de l'individu"
 S @UCONT@("AUTRE",1,"CTR")="B"
 D ^%QULELU(G,"^[QUI]QUERYV(""ARTICLE"")",18,4,UCONT)
 K @(TEMP)
 Q
 
SUITE S GA=A_","_B,@G@(A,GA)=""
 I $D(^[QUI]QUERYV("MOZ",GA,"OPERATION.MOZART")) S D="" F %D=0:0 S D=$O(^[QUI]QUERYV("MOZ",GA,"OPERATION.MOZART",D)) Q:D=""  S C=^[QUI]QUERYV("MOZ",GA,"OPERATION.MOZART",D),@G@(GA,GA_","_C)=""
 Q
GAMCTRB(TP) 
 N RE
 S RE=$S(@TP@("N")=1:"ARTICLE",@TP@("N")=2:"MOZ",@TP@("N")=3:"MOZOP")
 D CLEPAG^%VVIDEO,^%QSATTRI(@TP@("O"),RE,5,2,70,18),CLEPAG^%VVIDEO
 Q
GAMAFF(RIVX,LG) 
 N XX,YY,I
 S YY=@RIVX
 F I=1:1 S XX=$P(YY,","),YY=$P(YY,",",2,999) Q:YY=""
 Q XX
 
 
GLOBAL(GLO) 
 N G,I
 N TEMP,GRAPH,X,Y,CPT,PILE,%I,TABGLO,CORRES
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO") K @(TEMP)
 S GRAP=$$CONCAS^%QZCHAD(TEMP,"G")
 S UCONT=$$CONCAS^%QZCHAD(TEMP,"U")
 S CORRES=$$CONCAS^%QZCHAD(TEMP,"TB")
 S @UCONT@("AFF")="$$GLOAFF^%QULELZ"
 S @UCONT@("INFO")="$$INFO^%QULELZ"
 S @CORRES@(GLO)="global"
 S (REF(0),G)=GLO,CLEF(0)="",I=0
GLOBCL S X=$O(@REF(I)@(CLEF(I)))
 I X="" G:I=0 GLOSUI S I=I-1 G GLOBCL
 S G=$$CONCAS^%QZCHAD(REF(I),X),@GRAP@(REF(I),G)="",CLEF(I)=X,@CORRES@(G)=X
 I $D(@G)>9 S I=I+1,REF(I)=G,CLEF(I)=""
 G GLOBCL
GLOSUI S TITRE="1"_$C(0)_"5"_$C(0)_"decomposition du global "_GLO
 S TABGLO(GLO)="" D ^%QULELU(GRAP,"TABGLO",10,2,UCONT,TITRE)
 K @(TEMP)
 Q
 
GLOAFF(RREF,LG) N CLEF S CLEF=@CORRES@(@RREF) Q CLEF
 
INFO(TP) 
 N OBJ,RES
 S OBJ=@TP@("O")
 
 S RES="1"_$C(0)_"13"_$C(0)_OBJ
 I ($D(@OBJ)#10)'=1 Q RES
 S RES=RES_$C(0)_"2"_$C(0)_"1"_$C(0)_"valeur : "
 S RES=RES_$C(0)_"2"_$C(0)_"10"_$C(0)_@OBJ
 Q RES
 
TESTGLO N GLOB
 S GLOB=$$TEMP^%SGUTIL
 S @GLOB@(1,2,3)=123,^(4)=124,@GLOB@(1,1,1,1)=1111,^(2)=1112,^(3)=1113
 D GLOBAL(GLOB)
 K @(GLOB)
 Q
 
COMPO 
 N G,I
 N TEMP,GRAPH,X,Y,CPT,PILE,%X,%Y
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COMP") K @(TEMP)
 S G=$$CONCAS^%QZCHAD(TEMP,"G")
 S UCONT=$$CONCAS^%QZCHAD(TEMP,"U")
 S X="" F %X=0:0 S X=$O(^[QUI]NOMENC(X)) Q:X=""  S Y="" F %Y=0:0 S Y=$O(^[QUI]NOMENC(X,Y)) Q:Y=""  S @G@(X,Y)=""
 D ^%QULELU(G,"^[QUI]NOMENC",10,2,UCONT)
 K @(TEMP)
 Q
 
INTER 
 N TEMP,G,R,U,TITRE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TEST") K @(TEMP)
 S G=$$CONCAS^%QZCHAD(TEMP,"X")
 S R=$$CONCAS^%QZCHAD(TEMP,"R")
 S U=$$CONCAS^%QZCHAD(TEMP,"U")
 S @U@("AUTRE",1)="XXX^%QULELZ",@U@("AUTRE",1,"TXT")="CTRB",@U@("AUTRE",1,"COM")="Texte de CTRB",@U@("AUTRE",1,"CTR")="B"
 S @U@("AFF")="$$ABRV^%QULELZ"
 S @U@("CUT")="XXX^%QULELZ"
 S @U@("CUT","CTR")="P"
 S @U@("PASTE")="XXX^%QULELZ"
 S @U@("PASTE","CTR")="D"
 F I=1:1 W !,"Arc de : " R X Q:X=""  W " a :" R Y S @G@(X,Y)=""
 F I=1:1 W !,"Racine : " R X Q:X=""  S T(X)=""
 S TITRE="1"_$C(0)_"1"_$C(0)_"essai"_$C(0)_"1"_$C(0)_"20"_$C(0)_"de"_$C(0)_"2"_$C(0)_"21"_$C(0)_"titre"
 D ^%QULELU(G,"T",5,3,U,TITRE)
 K @(TEMP)
MODULES 
 N TEMP,UCONT,ROOT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T")
 S UCONT=$$CONCAS^%QZCHAD(TEMP,"U")
 S @UCONT@("INFO")="$$COMMENT^%QULELZ"
 S TITRE="1"_$C(0)_"20"_$C(0)_$$^%QZCHW("ARBRE D'APPEL DES MODULES")
 D ^%QULELU("^%UTDVT(""INTER"")","^%UTDVT(""MOD"")",12,3,UCONT,TITRE)
 K @(TEMP)
 Q
COMMENT(MP,M,N,L) 
 Q "1"_$C(0)_"1"_$C(0)_^%UTDVT("MOD",@M)

