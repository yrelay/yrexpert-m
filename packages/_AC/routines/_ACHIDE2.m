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

;%ACHIDE2^INT^1^59547,73864^0
ACHIDE2 ;
 
 
 
 
 
 
 
CAR N %N,A,DIA,N,NUM,TEMP,MENU,ADR,CTR,GLO,TAB
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S TAB=$$CONCAS^%QZCHAD(TEMP,"ATR")
 S DIA=$$DIA^%ACHICMS(STO) Q:DIA=""
 S MENU=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S @MENU@(1)=$$^%QZCHW("Selection")_"^"_"SEL",@MENU@(1,"COM")=$$^%QZCHW("Selection de modules")
 S @MENU@(2)=$$^%QZCHW("Tous")_"^"_"ALL",@MENU@(2,"COM")=$$^%QZCHW("Pour tous les modules")
ACT S DX=0,DY=22 D CLEBAS^%VVIDEO
 D ^%VQUIKMN(10,79,22,MENU,.ADR,.CTR) I (CTR="A")!(CTR="F") K @(TEMP) Q
 G:ADR'="" @ADR G ACT
 
SEL 
 D SELM^%ACHIDE5(STO,SECT,0)
 S GLO=$$CONCAS^%QZCHAD(STO,"SEL")
 I '($D(@GLO)) G ACT
 D AFF^%ACHIDEF G SAI
 
ALL S GLO=$$CONCAS^%QZCHAD(STO,"PLNUM") G SAI
 
SAI S NUM=""
 F %N=0:0 S NUM=$O(@GLO@(NUM)) Q:NUM=""  D INIT(NUM,DIA,TAB),ATR
 
 S @STO@("DISTANCE")=0,@STO@("MAJ")=0
 D AFF^%ACHIDEF
 G ACT
 
ATR 
 S DX=0,DY=22 D CLEBAS^%VVIDEO
 S DX=30 X XY D BLD^%VVIDEO,REV^%VVIDEO X XY W $$^%QZCHW("Module")," : ",NUM D NORM^%VVIDEO
 F N=1:1 Q:'($D(@TAB@(N)))  S A=$O(@TAB@(N,"")),@TAB@(N,A)=$S($D(@STO@("CAR",NUM,A)):@STO@("CAR",NUM,A),1:"")
 D ^%QUSAIS2(TAB,0,1,79,21)
 F N=1:1 Q:'($D(@TAB@(N)))  S A=$O(@TAB@(N,"")),@STO@("CAR",NUM,A)=@TAB@(N,A),@STO@("ATR",A)=""
 Q
 
INIT(NO,D,TAB) 
 
 N %A,%F,F,C,T,DI,N,I,ST,NIND
 K @(TAB)
 S NIND=SECT_","_$S($D(@GLOSTO@(SECT,"CAR",NO,"NOM")):@GLOSTO@(SECT,"CAR",NO,"NOM"),1:NO)
 S F="",ST=0
 F %F=0:0 S F=$O(^[QUI]TLDIAL(D,F)) Q:F=""  S T="" F %A=0:0 S T=$O(^[QUI]TLDIAL(D,F,T)) Q:T=""  D INS
 I ST=0 S @TAB@($ZP(@TAB@(""))+1,"SURFACE")=""
 Q
INS S:T="N" N=1 S:T="O" N=""
 S C=^[QUI]TLDIAL(D,F,T),DI=$ZP(@TAB@(""))
 I T="O" F I=1:1:10 I $P(C,"^",I)'="" S N=$$^%QSCALVA(REPFI,NIND,$P(C,"^",I)),N=$$OR^%QSCALVA(REPFI,NIND,$P(C,"^",I),N) I N'="" Q
 S:N="" N=1
 F I=1:1:10 I $P(C,"^",I)'="" S DI=DI+1,@TAB@(DI,$P(C,"^",I)_$S(N=1:"",1:" ("_N_")"))="" I ($P(C,"^",I)="SURFACE")&(N=1) S ST=1
 Q
 
 
NOM N %N,ATR,CAR,N,NUM,TEMP,MENU,ADR,CTR,GLO
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 
 S CAR=$$CONCAS^%QZCHAD(STO,"CAR")
 
 S NUM=""
 F %N=0:0 S NUM=$O(@STO@("PLNUM",NUM)) Q:NUM=""  I $D(@CAR@(NUM,"NOM")) S N=$P(@CAR@(NUM,"NOM"),"/",1) I N'=NUM,'($D(@TEMP@("EXI",N))) S @TEMP@("EXI",N)=NUM
 S MENU=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S @MENU@(1)=$$^%QZCHW("Selection")_"^"_"SELN",@MENU@(1,"COM")=$$^%QZCHW("Selection de modules")
 S @MENU@(2)=$$^%QZCHW("Tous")_"^"_"ALLN",@MENU@(2,"COM")=$$^%QZCHW("Pour tous les modules")
ACTN S DX=0,DY=22 D CLEBAS^%VVIDEO
 D ^%VQUIKMN(10,79,22,MENU,.ADR,.CTR) I (CTR="A")!(CTR="F") K @(TEMP) Q
 G:ADR'="" @ADR G ACTN
 
SELN 
 D SELM^%ACHIDE5(STO,SECT,0)
 S GLO=$$CONCAS^%QZCHAD(STO,"SEL")
 D AFF^%ACHIDEF
 I '($D(@GLO)) G ACTN
 G SAIN
 
ALLN S GLO=$$CONCAS^%QZCHAD(STO,"PLNUM") G SAIN
 
SAIN S NUM=""
 F %N=0:0 S NUM=$O(@GLO@(NUM)) Q:NUM=""  D ATRN Q:CTRLA=1
 
 S @STO@("DISTANCE")=0,@STO@("MAJ")=0
 G ACTN
 
ATRN 
 N V,VD
A2 S DX=0,DY=22 D CLEBAS^%VVIDEO
 S DX=20 X XY D BLD^%VVIDEO X XY W $$^%QZCHW("Module")," : ",NUM D NORM^%VVIDEO
 
 S VD=$S($D(@CAR@(NUM,"NOM")):@CAR@(NUM,"NOM"),1:NUM)
 S DY=23,DX=5 X XY
 S V=$$^%VZAME1($$^%QZCHW("Nom de ce module")_" "_$S(VD="":"",1:"["_VD_"] ")_": ")
 I V="" S V=VD
 I V["," D ^%VZEAVT($$^%QZCHW("Le nom ne doit pas contenir de virgule")) G A2
 Q:CTRLA=1
 
 I $D(@TEMP@("EXI",V)) S N=@TEMP@("EXI",V) I N'=NUM S @CAR@(N,"NOM")=V_"/"_N,@STO@("NUM",V_"/"_N)=N K @STO@("NUM",V) S V=V_"/"_NUM G SA
 
 S @TEMP@("EXI",V)=NUM
SA S @CAR@(NUM,"NOM")=V,@STO@("NUM",V)=NUM,@STO@("ATR","NOM")=""
 I V'=VD K @STO@("NUM",VD)
 Q
 
 
PRO N CTR,ATR,A,EX,NB
 S DX=0,DY=22 D CLEBAS^%VVIDEO
 S DY=23 X XY D LIRE2^%VREAD($$^%QZCHW("Quel attribut (numero)")_" ? ","",0,RM-4,DY+1,DY-1,"","",.CTR,.ATR)
 I CTR'="" Q
 S M=ATT,NB=NBR
 I ATR="" S NBR=LC-2 G FPR
 
 S A=$P(ATR," (",1)
 S EX=$$LEX^%LXSTOCK(A,.A)
 I EX=2 D ^%VZEAVT($$^%QZCHW("Attribut ambigu au lexique")) G PRO
 I EX=0 D ^%VZEAVT($$^%QZCHW("Attribut inconnu au lexique")) G PRO
 I ATR["(" S ATR=A_" ("_$P($P(ATR,"(",2),")",1)_")"
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Sur combien de caracteres")_" ("_NBR_") ? ",NBR,0,RM-4,DY+1,DY-1,"","",.CTR,.NBR)
 I NBR="" S NBR=LC-2
FPR 
 I NBR<NB S M=0 D AFF^%ACHIDEF Q
 
 I (M'=ATR)!(NBR'=NB) S ATT=ATR D AFFC^%ACHIAFF(STO,LC,ATT,0,NBR)
 Q

