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

;%ACHIPAR^INT^1^59547,73864^0
%ACHIPAR ;
 
 
 
 
 
 
 
 N ADR,DEFF,DEFP,LIEN,MODU,REPP,REPPI,REPF,REPFI,SECT
 
 S ADR=$$ADR^%ACHICMS
 
 I ($D(@ADR)#10)'=1 S (DEFF,DEFP)="" G AFF
 S DEFP=$P(@ADR,"^",1),DEFF=$P(@ADR,"^",2)
AFF 
 D TIT^%ACHICMS("Parcours minimal")
PERE 
 S REPP=$$REP^%ACHICMS("secteur",0,8,DEFP)
 I REPP="" Q
 S REPPI=$$NOMINT^%QSF(REPP)
 
FILS 
 S REPF=$$REP^%ACHICMS("module",0,11,DEFF)
 I REPF="" G PERE
 S REPFI=$$NOMINT^%QSF(REPF)
 
 S LIEN=$$LIEN1^%QSGEL2(REPPI,REPFI,2) I LIEN="" D ^%VZEAVT($$^%QZCHW("Ces 2 repertoires ne sont pas relies par un lien hierarchique")) G FILS
 
 S @ADR=REPP_"^"_REPF_"^"_$S(($D(@ADR)#10)'=1:"",1:$P(@ADR,"^",3))
 S DEFP=REPP,DEFF=REPF
 
NOM 
 S SECT=$$SECT^%ACHICMS(0,14,REPP,"REAFF^%ACHIPAR")
 I SECT="" G FILS
 
 I '($$IR^%QSGE5(REPPI,SECT)) D ^%VZEAVT($$^%QZCHW("Ce secteur n'existe pas")) G NOM
 S DX=9,DY=14 X XY W $$^%QZCHW("Nom du secteur")," : ",SECT
 
 I @ADR@(REPPI,SECT,"DISTANCE")=0 D CALC^%ACHIDIS($$CONCAS^%QZCHAD(ADR,REPPI),SECT,REPFI)
 
MOD 
 S MODU=$$MODU(0,17,REPFI,REPPI,SECT,"REAF2^%ACHIPAR")
 I MODU="" G NOM
 S DX=9,DY=17 X XY W $$^%QZCHW("Nom du module de depart"),"  : ",MODU
 D PARC(REPPI,SECT,REPFI,MODU,"CONS^%ACHIPAR")
 D VISU(REPPI,SECT,REPFI,MODU),CLEPAG^%VVIDEO,REAF2
 G MOD
 
PARC(REPPI,SECT,REPFI,MODU,ROU) 
 N %I,%J,ATR,GLAM,I,J,MATO,SOL
 D MSG^%VZEATT($$^%QZCHW("Initialisations en cours"))
 
 S GLAM=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MATRICE") K @(GLAM)
 
 S ATR=$$ATP,ATD=$$ATD
 
 D @ROU
 S MATO=1 K ^RES($J)
 D ^%QARBCON("^RES($J)","^%QARBEVA","^%QARBSEP","^%QARBSEL",MODU)
 
 D PSV^%QSGESTI(REPPI,SECT,ATD)
 I '($D(^RES($J,"SOLUTION"))) G FIN
 
 D MSG^%VZEATT($$^%QZCHW("Stockage des solutions"))
 S I=""
 F %I=1:1 S I=$O(^RES($J,"SOLUTION",I)) Q:I=""  S SOL=^RES($J,"SOLUTION",I) D PA^%QSGESTI(REPPI,SECT,ATD,SOL,I) F J=1:1 Q:'($D(^RES($J,"SOLUTION",I,J+1)))  D PA^%QSGESTI(REPFI,SECT_","_^RES($J,"SOLUTION",I,J),ATR,J,I)
 
FIN K @(GLAM),^RES($J) Q
 
CONS 
 N %I,ATD,FILS,I,J,T
 
 S FILS=$$LIEN1^%QSGEL2(REPPI,REPFI,2)
 
 S ATD=$$ATDIST^%ACHINDI
 S I=""
 
 F %I=0:0 S I=$$NXTRIAV^%QSTRUC8(REPPI,SECT,FILS,I) Q:I=""  D PSV^%QSGESTI(REPFI,SECT_","_I,ATR) S J="" F %I=0:0 S J=$$NXTRIAV^%QSTRUC8(REPPI,SECT,FILS,J) Q:J=""  S D=$$^%QSCALIN(REPFI,SECT_","_I,ATD,J) S:D="" D=10E10 S @GLAM@(1,"LIG",I,J)=D,@GLAM@(1,"COL",J,I)=D
 Q
 
VISU(REP,SECT,REPF,MOD) 
 N %I,ATR,DIS,GL,I,N,P,STO,O,%O,ATTP
 S ATR=$$ATD
 S DIS=$$^%QSCALIN(REP,SECT,ATR,1)
 I DIS="" D ^%VZEAVT($$^%QZCHW("Aucun parcours minimal n'a ete detecte")) G FV
 D CLEPAG^%VVIDEO
 S STO=$$CONCAS^%QZCHAD($$ADR^%ACHICMS,REP)
 S STO=$$CONCAT^%QZCHAD(STO,""""_SECT_"""")
 
 D AFFM^%ACHIAFF(SECT,STO,@STO@("POS","LC"),@STO@("POS","HC"),0,0,0,@STO@("POS","LC")-2)
 D ^%VZCDB($$^%QZCHW("Parcours a partir de")_" "_MOD,0)
 S ATTP=$$LIEN1^%QSGEL2(REP,REPF,2)
 S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8(REP,SECT,ATTP,O) Q:O=""  S I=$$VALEUR^%QSTRUC8(REP,SECT,ATTP,O),P=$$^%QSCALIN(REPF,SECT_","_I,$$ATP,1),N=$S($D(@STO@("NUM",I)):@STO@("NUM",I),1:I),DY=$O(@STO@("PLNUM",N,"")),DX=$O(@STO@("PLNUM",N,DY,"")) X XY D BLD^%VVIDEO X XY W P
 S DX=10,DY=22 D NORM^%VVIDEO X XY W $$^%QZCHW("Distance de ce parcours")," = ",DIS
 D ^%VZEAVT($S($$^%QSCALIN(REP,SECT,ATR,2)="":"",1:"Pour les autres solutions, voir sur les individus secteur et modules"))
FV Q
 
 
 
REAFF 
 D TIT^%ACHICMS("Parcours minimal")
 S DX=9,DY=8 X XY W $$^%QZCHW("Nom du repertoire secteur")," : ",REPP
 S DX=9,DY=11 X XY W $$^%QZCHW("Nom du repertoire module"),"  : ",REPF
 Q
REAF2 
 D REAFF
 S DX=9,DY=14 X XY W $$^%QZCHW("Nom du secteur")," : ",SECT
 Q
 
MODU(X,Y,REP,REPS,S,RAFF) 
 N CTR,MODU,MSG,TEMPMO,O,%O,V
MO S DX=X,DY=Y D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Nom du module de depart")_" : ","",8,RM-4,DY+1,DY-1,"","",.CTR,.MODU)
 I CTR'="" Q ""
 I MODU="" G MO
 I MODU'="?" G MODU2
 S TEMPMO=$$TEMP^%SGUTIL
 S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8(REPS,S,LIEN,O) Q:O=""  S V=$$VALEUR^%QSTRUC8(REPS,S,LIEN,O),@TEMPMO@(V)=""
 S MODU=$$SELECT^%QSGEST6(TEMPO)
 D:RAFF'="" @RAFF
 K @(TEMPMO)
 G:MODU="" MO
MODU2 
 I '($$IR^%QSGE5(REP,S_","_MODU)) D ^%VZEAVT($$^%QZCHW("Ce module n'existe pas")) G MO
 Q MODU
 
ATP() Q "NUMERO.VISITE"
 
ATD() Q "DISTANCE.MINIMALE"

