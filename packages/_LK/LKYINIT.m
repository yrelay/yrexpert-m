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

;LKYINIT^INT^1^59547,74868^0
LKYINIT(BASE) 
 
 
 
 
 
 
 N %I,AA,CTR,MSG,NOM,LONG,LILI,LAA,MODAFF
 K ^DAT($J)
NOM 
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW("Initialisations"))
 S DX=10,DY=10 D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Nom de la passerelle")_" : ","",1,RM-4,DY+1,DY-1,"","",.CTR,.NOM)
 I (NOM="")!(CTR'="") Q $$^%QZCHW("arret")
 I NOM="?" S NOM=$$SELECT^%QSGEST6("^[QUI]LKY2",$$^%QZCHW("Choisissez une passerelle")) G:NOM="" NOM
 I '($D(^[QUI]LKY2(NOM))) D ^%VZEAVT($$^%QZCHW("Cette passerelle n'existe pas")) G NOM
 
 I '($D(^[QUI]RQSDON("LK",NOM,"ETAT"))) G VALER
 I ^[QUI]RQSDON("LK",NOM,"ETAT")'="OK" G VALER
 
 D ^%VZEATT
 S MODAFF=1
 
PREPA 
 S BASE=""
 S LILI=$$CONCAS^%QZCHAD("^[QUI]LKY2",NOM)
 S MSG=$$OUT^%QZCHGE(LILI,1,.AA)
 
 S ^DAT($J,"E")=$S(AA="":1,1:AA)
 S MSG=$$OUT^%QZCHGE(LILI,2,.AA)
 S ^DAT($J,"S")=AA
 
 S MSG=$$OUT^%QZCHGE(LILI,3,.BASE)
 S ^DAT($J)=BASE
 
 S LILI=$$CONCAS^%QZCHAD("^[QUI]LKYENR2",NOM),LONG=0
 S MSG="",AA=""
 F %I=0:0 S AA=$O(@LILI@(AA)) Q:AA=""  D TE
 S ^DAT($J,"L")=LONG
 
 S MSG=$$INIT("^DAT($J)",BASE,NOM)
 S ^DAT($J,"NOMPASSERELLE")=NOM
 Q MSG
 
VALER D ^%VZEAVT($$^%QZCHW("Cette passerelle n'a pas subi de validation correcte")) G NOM
 
TE 
 S MSG=$$OUT^%QZCHGE($$CONCAS^%QZCHAD(LILI,AA),1,.LAA)
 S ^DAT($J,"E",AA,"LONGUEUR")=LAA
 S LONG=$$MAX^%QZCA(LONG,LAA)
 Q
 
INIT(DATA,BASE,NOM) 
 
 
 N ER,ATT,FIRST,LAST,NUM,VALDEF,VALNUM,VALDAT,ORDRE,GLO,CAR,REP,MOT,POS,L,L2,CONT
 S GLO=$$CONCAS^%QZCHAD(DATA,"REP")
 S LILI=$$CONCAS^%QZCHAD("^[QUI]LKYATR2",NOM)
 
 
 S ATT=""
AT S ATT=$O(@LILI@(ATT))
 G:ATT="" VERENR
 S NUM=$O(@LILI@(ATT,""))
BENR G:NUM="" AT
 D T
 S NUM=$O(@LILI@(ATT,NUM))
 G BENR
 
VERENR 
 S NUM=""
NUM S NUM=$O(@GLO@("D",NUM))
 G:NUM="" VERILI
 S FIRST="",LAST=0
 F %I=0:0 S FIRST=$O(@GLO@("D",NUM,FIRST)) Q:FIRST=""  D T1
 G NUM
 
VERILI 
 
 S ATT=""
BVERLI S ATT=$O(@GLO@("L",ATT))
 Q:ATT="" ""
 S L=ATT
 S POS=$L(L,"~")
 G:POS=1 BVERLI
 S L2=$P(L,"~",POS)
 G:$E(L2,1,5)'="LIEN." BVERLI
 S L2=$P(L2,"LIEN.",2)
 S @GLO@("L",$P(L,"~",1,POS-1)_"~"_L2)=""
 G BVERLI
 
T S FIRST=""
TF S REP=BASE
 S FIRST=$O(@LILI@(ATT,NUM,FIRST)) Q:FIRST=""
 S CONT=$$CONCAS^%QZCHAD(LILI,ATT_","_NUM_","_FIRST)
 S ER=$$OUT^%QZCHGE(CONT,1,.LAST)
 I ATT="CONSTANTE" S (CAR,ORDRE,VALDAT,VALNUM)="" G TV
 
 S ER=$$OUT^%QZCHGE(CONT,2,.ORDRE)
 S ER=$$OUT^%QZCHGE(CONT,5,.VALNUM)
 S ER=$$OUT^%QZCHGE(CONT,6,.CAR)
 I CAR="" S CAR=" "
 S ER=$$OUT^%QZCHGE(CONT,8,.VALDAT)
TV S ER=$$OUT^%QZCHGE(CONT,3,.VALDEF)
 S REP=REP_"~"_$P(ATT,"~",2,99),MOT=$P(ATT,"~")
 F %I=1:1 S L=$P(REP,"~",%I) Q:L=""  S L=$P(REP,"~",1,%I) S:'($D(@GLO@("L",L))) @GLO@("L",L)=""
 I $E(REP,$L(REP))="~" S REP=$E(REP,1,$L(REP)-1)
 S @GLO@("D",NUM,FIRST,"T")=(LAST-FIRST)+1
 S @GLO@("D",NUM,FIRST,"ATT")=MOT
 S @GLO@("D",NUM,FIRST,"V")=VALDEF
 S @GLO@("D",NUM,FIRST,"N")=$S(VALNUM="":0,1:VALNUM)
 S @GLO@("D",NUM,FIRST,"NC")=$S(CAR="":0,1:CAR)
 S @GLO@("D",NUM,FIRST,"F")=VALDAT
 S @GLO@("D",NUM,FIRST,"O")=ORDRE
 S @GLO@("D",NUM,FIRST,"L")=REP
 G TF
 
T1 I (LAST+$L(@DATA@("S")))<(FIRST-1) S @GLO@("D",NUM,LAST+1,"T")=(FIRST-LAST)-1,@GLO@("D",NUM,LAST+1,"N")=0
 S LAST=(@GLO@("D",NUM,FIRST,"T")+FIRST)-1
 Q
 
 
 
ACTIV(MODAFF,NOM,BASE) 
 N %I,AA,CTR,MSG,LONG,LILI,LAA
 K ^DAT($J)
 D:MODAFF CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW("Initialisations")),^%VZEATT
 G PREPA
 ;

