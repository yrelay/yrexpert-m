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

;%SDSCAC2^INT^1^59547,73889^0
SDSCAC2 ;
 
 
 
 
 
 
 
 
VARTEMP 
 I ('($D(@TINT@("VAR"))))&('($D(@TINT@("IND")))) Q
 D MSG^%VZEATT($$^%QZCHW("Initialisation du contexte d'interpretation"))
 S @GENVO@("%","BASE")="%"
 S @GENVO@("%","OBJET")=$J
 
 N BA,OBJ,REP,V,VAR
 S VAR=""
BCVA S VAR=$O(@STO@("VAR",VAR)) I VAR="" G BCIN
 S V=@STO@("VAR",VAR)
 I V="" D ADD($$^%QZCHW("La variable temporaire")_" "_VAR_" "_$$^%QZCHW("n'a pas de valeur"))
 D PA^%QSGESTI("%",$J,VAR,V,1)
 G BCVA
 
BCIN S VAR=$O(@STO@("IND",VAR)) I VAR="" Q
 
 I VAR="@" G BCIN
 I $E(VAR,1,6)="%POINT" G BCIN
 S BA=@STO@("IND",VAR,"BA")
 I BA="" D ADD($$^%QZCHW("L'individu temporaire")_" "_VAR_" "_$$^%QZCHW("n'a pas de repertoire"))
 S OBJ=@STO@("IND",VAR,"O")
 I OBJ="" D ADD($$^%QZCHW("L'individu temporaire")_" "_VAR_" "_$$^%QZCHW("n'a pas de nom"))
 S REP=$$NOMINT^%QSF(BA)
 I (REP'="")&(OBJ'=""),'($$IR^%QSGE5(REP,OBJ)) D ADD($$^%QZCHW("L'individu")_" "_OBJ_" "_$$^%QZCHW("n'existe pas dans le repertoire")_" "_BA)
 S @GENVO@(VAR,"BASE")=REP
 S @GENVO@(VAR,"OBJET")=OBJ
 G BCIN
 
 
ADD(M) 
 N I
 S I=$ZP(@ERR@(""))+1
 S @ERR@(I)=M,@ERR@(I+1)=" "
 Q
 
 
POINT 
 D MSG^%VZEATT($$^%QZCHW("evaluation des points"))
 N NOMP,NPT,REP,X,Y
 S REP="%"_$J
 S NPT=""
BCPT S NPT=$O(@STO@("PT",NPT))
 I NPT="" D POCLEPA^%VVIDEO Q
 
 S X=@STO@("PT",NPT,"X")
 I X="" S X=$$CALC(NPT,"X")
 
 S Y=@STO@("PT",NPT,"Y")
 I Y="" S Y=$$CALC(NPT,"Y")
 
 S NOMP="%POINT"_NPT
 S @GENVO@(NOMP,"BASE")=REP
 S @GENVO@(NOMP,"OBJET")=NPT
 
 D PA^%QSGESTI(REP,NPT,"ABSCISSE",X,1)
 D PA^%QSGESTI(REP,NPT,"ORDONNEE",Y,1)
 G BCPT
 
CALC(NP,TYP) 
 
 N AD,CO,NOBJ,OVJ,VO
 
 S NOBJ=""
CAOB S NOBJ=$O(@STO@("OBJ",NOBJ)) I NOBJ="" Q ""
 
 S OBJ=$O(@STO@("OBJ",NOBJ,"R","")),VO=$O(@STO@("OBJ",NOBJ,"R",OBJ,""))
 
 S AD=$$DEF^%SDOCMS(OBJ,VO)
 I '($D(@AD@("PT",NP))) G CAOB
 
 S T=@AD@("PT",NP)
 
 I T="" G CALF
 
 I T="A" S CO=@AD@("PT",NP,TYP) Q CO
 
 S @("CO="_@AD@("PT",NP,TYP))
 I CO'="" Q CO
CALF 
 I '($D(@AD@("PTR",NP,TYP))) D ADD($$^%QZCHW("POINT")_" "_NP_" "_$$^%QZCHW("a une")_" "_$$^%QZCHW($S(TYP="X":"abscisse",1:"ordonnee"))_" "_$$^%QZCHW("indefinie")) Q ""
 I TYP="X" D ADD($$^%QZCHW("POINT")_" "_NP_" "_$$^%QZCHW("a une abscisse indefinie ==> on prend l'abscisse de presentation"))
 I TYP="Y" D ADD($$^%QZCHW("POINT")_" "_NP_" "_$$^%QZCHW("a une ordonnee indefinie ==> on prend l'ordonnee de presentation"))
 S CO=@AD@("PTR",NP,TYP)
 Q CO
 
COPY 
 
 N CCXT,I,J,K,L
 S K="" F I=0:0 S K=$O(CXT(K)) Q:K=""  S L="" F I=0:0 S L=$O(CXT(K,L)) Q:L=""  I $E(L,1,6)="%POINT" S CCXT($P(K,"%POINT",2),L)=CXT(K,L)
 S K="" F I=0:0 S K=$O(CCXT(K)) Q:K=""  S L="" F I=0:0 S L=$O(CCXT(K,L)) Q:L=""  S CXT(K,L)=CXT(K,L)
 Q

