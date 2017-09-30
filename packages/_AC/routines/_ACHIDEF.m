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

;%ACHIDEF^INT^1^59547,73864^0
ACHIDEF ;
 
 
 
 
 
 
 
 
 
 
 
 
DEF(SECT,STO,LC,HC,MOD) 
 N GLO,S
 S GLO=$$CONCAT^%QZCHAD(STO,""""_SECT_"""")
 
 I $D(@GLO@("PLAN")) D AFFM^%ACHIAFF(SECT,GLO,LC,HC,0,"",1,LC-2) G S
 D AFF^%ACHIAFF(SECT,GLO,LC,HC)
S 
 S S=$$SAIS(GLO,LC,HC,MOD) I S=0 Q 0
 
 I S=1 D AFFM^%ACHIAFF(SECT,GLO,LC,HC,0,"",1,LC-2)
 
 D OUVCAR(SECT,GLO,LC,HC,MOD)
 Q 1
 
SAIS(STO,LC,HC,MOD) 
 N %F,I,X1,TEMP,NUM,M
 S M=0
 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TEMPO") K @(TEMP)
 
 I MOD=0 D RECUP
 
 S NUM=$ZP(@STO@("PLNUM","")) I NUM="" S NUM=0
 S NUM=$TR($J("",(LC-2)-$L(NUM))," ",0)_NUM
 D POCLEPA^%VVIDEO X XY W $$^%QZCHW("CTRLA : sortie, CTRLF : sauvegarde, CTRLG : suppression, [RETURN] creation")
 
 I MOD=0 S DY=$O(@STO@("PLAN","")) S:DY'="" DX=$O(@STO@("PLAN",DY,""))+1,DY=DY+1
 I (MOD=1)!(DY="") S DX=@STO@("POS","DXG"),DY=@STO@("POS","DYH")
MOUV D POS(DY,DX) X XY D ECHOFF^%VVIDEO,ZFLECHE^%VZATOU,ECHON^%VVIDEO G:%F'="" @%F
 F I=1,6,7,13 G:I=X1 @I
 G:(X1<32)!(X1>126) ER
 D NUM G 13
B 
 I DY=@STO@("POS","DERY") S DY=@STO@("POS","DYH") G MOUV
 S DY=(DY+HC)-1 G MOUV
H 
 I DY=@STO@("POS","DYH") S DY=@STO@("POS","DERY") G MOUV
 S DY=DY-(HC-1) G MOUV
G 
 I DX=@STO@("POS","DXG") S DX=@STO@("POS","DERX") G MOUV
 S DX=DX-(LC-1) G MOUV
D 
 I DX=@STO@("POS","DERX") S DX=@STO@("POS","DXG") G MOUV
 S DX=(DX+LC)-1 G MOUV
1 
 K @(TEMP)
 Q 0
6 
 I M=1 D SAUV^%ACHIAFF(TEMP,STO)
 K @(TEMP)
 Q $S(M=1:1,1:2)
7 
 G:'($D(@TEMP@("POS",DY-1,DX-1))) ER
 K @TEMP@("POS",DY-1,DX-1)
 D REV(DX-1,DY-1)
 S M=1 G D
13 
 S @TEMP@("POS",DY-1,DX-1)=NUM,M=1
 X XY W NUM
 G D
ER D ^%VSQUEAK G MOUV
 
POS(Y,X) 
 N DX,DY
 S DX=70,DY=0 X XY W " ",Y," - ",X," " Q
 
RECUP N %I,%J,Y,X,N
 S Y=""
 F %I=0:0 S Y=$O(@STO@("PLAN",Y)) Q:Y=""  S X="" F %J=0:0 S X=$O(@STO@("PLAN",Y,X)) Q:X=""  S N=$P(@STO@("PLAN",Y,X),"^",1) I N'="" S @TEMP@("POS",(Y-HC)+1,(X-LC)+1)=N
 Q
 
NUM N Y1,PCX,PCY,YG,PX,PY,X2
 S PX=DX,PY=DY,X2=X1
SN S YG=$C(X2),DX=PX,DY=PY X XY W $C(X2) S PCX=DX,PCY=DY D BEG^%VLEC I CTRLA=1 G FN
 I $L(Y1)>(LC-2) D ^%VZEAVT($$^%QZCHW("Le numero doit etre de longueur inferieure ou egale a")_" "_(LC-2)) G SN
 I '($$ADR^%QZNBN1(Y1)) G SN
 S NUM=$TR($J("",(LC-2)-$L(Y1))," ",0)_Y1
FN S DX=PX,DY=PY X XY W NUM Q
 
REV(X,Y) 
 N DX,DY
 S DX=X F DY=Y:1:(Y+HC)-1 X XY D REV^%VVIDEO X XY W $J("",LC)
 D NORM^%VVIDEO
 Q
 
OUVCAR(SECT,STO,LC,HC,MOD) 
 N ADR,CTR,M,MEN,ATT,NBR
 S ATT="",NBR=LC-2
 S MEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU") K @(MEN)
 S @MEN="23^35^79"
 S @MEN@(1)=$$^%QZCHW("Ouvertures")_"^"_"OUV^%ACHIDE3",@MEN@(1,"COM")=$$^%QZCHW("Definition des ouvertures")
 S @MEN@(2)=$$^%QZCHW("Attributs")_"^"_"CAR^%ACHIDE2",@MEN@(2,"COM")=$$^%QZCHW("Saisie des caracteristiques")
 S @MEN@(3)=$$^%QZCHW("Noms")_"^"_"NOM^%ACHIDE2",@MEN@(3,"COM")=$$^%QZCHW("Saisie des noms de modules")
 S @MEN@(4)=$$^%QZCHW("Projection")_"^"_"PRO^%ACHIDE2",@MEN@(4,"COM")=$$^%QZCHW("Projection de la valeur des attributs")
 S @MEN@(5)=$$^%QZCHW("Visu")_"^"_"VIS^%ACHIDE4",@MEN@(5,"COM")=$$^%QZCHW("Visu selective des modules")
 S @MEN@(6)=$$^%QZCHW("Traitements")_"^"_"TRT^%ACHIDE4",@MEN@(6,"COM")=$$^%QZCHW("Traitement d'un ensemble de modules")
 S @MEN@(7)=$$^%QZCHW("Acces")_"^"_"ACC^%ACHIDE5",@MEN@(7,"COM")=$$^%QZCHW("Acces a un individu module")
 S @MEN@(8)=$$^%QZCHW("Modif")_"^"_"MOD",@MEN@(8,"COM")=$$^%QZCHW("Modifications des modules")
 S @MEN@(9)=$$^%QZCHW("Distances")_"^"_"DIS^%ACHIDE5",@MEN@(9,"COM")=$$^%QZCHW("Maj des distances")
 S @MEN@(10)=$$^%QZCHW("Parcours")_"^"_"PARC^%ACHIDE5",@MEN@(10,"COM")=$$^%QZCHW("Parcours minimal des modules")
 S @MEN@(11)=$$^%QZCHW("Deselection")_"^"_"NET",@MEN@(11,"COM")=$$^%QZCHW("Annulation de la selection des modules")
ACT S M=0,DX=0,DY=22 D CLEBAS^%VVIDEO
 D ^%VQUIKMN(0,79,22,MEN,.ADR,.CTR) I (CTR="A")!(CTR="F") D COR K @(MEN) Q
 I ADR'="" D @ADR G ACT
 I CTR="R" S M=0 D AFF
 I CTR="J" D MSG^%VZEATT($$^%QZCHW("Impression en cours")_" ..."),AFFM^%ACHIAFF(SECT,STO,LC,HC,1,ATT,0,NBR)
 G ACT
 
AFF D AFFM^%ACHIAFF(SECT,STO,LC,HC,0,ATT,M,NBR)
 Q
 
NET I $D(@STO@("SEL")) D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous vraiment annuler la selection des modules"))=1 K @STO@("SEL") S M=0 D AFF
 Q
 
MOD S M=$$SAIS(STO,LC,HC,0) I M=1 G AFF
 Q
 
COR 
 N %N,N,P,S,NOM,NUM
 D ^%VZEATT
 S N="",P=0
 F %N=0:0 S N=$O(@STO@("NUM",N)) Q:N=""  I '($D(@STO@("PLNUM",@STO@("NUM",N)))) K @STO@("NUM",N)
 S N="" F %N=0:0 S N=$O(@STO@("NUM",N)) Q:N=""  D CMP
 Q
CMP 
 S S=$O(@STO@("NUM",N)),NOM=$P(N,"/",1)
 I $P(S,"/",1)=NOM S N=S,P=1 G CMP
 I P=1 S P=0 Q
 Q:NOM=N
 S NUM=@STO@("NUM",N),@STO@("CAR",NUM,"NOM")=NOM,@STO@("NUM",NOM)=NUM
 K @STO@("NUM",N) Q

