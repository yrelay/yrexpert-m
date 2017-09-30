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

;%QSIMPET^INT^1^59547,73882^0
QSIMPET ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %I,ATR,ATT,BASE,BOOL,CAR,CAR2,COM1,COM2,COM3,COM4,CONT,CPT,ETAT,I,II,IMP,J,L,LA,LATTR,LISTE,LL,NBRL,NF,NL,PAGE,REP,T,TITRE,TAB,TAB2,TOT,TRI,SAVI
 S SAVI=$I
NET D POCLEPA^%VVIDEO S Y2=$$^%VZAME1("Nom de l'etat : ") Q:Y2=""
 G:Y2="?" LIST
 I '($D(^[QUI]QSETAT(Y2))) D ^%VZEAVT($$^%QZCHW("Etat inconnu")) G NET
NLI D POCLEPA^%VVIDEO S Y3=$$^%VZAME1("Nom de la liste :") I Y3="?" S Y3=$$^%QS1CHLI($P(^[QUI]QSETAT(Y2),"^",6)) D CLEPAG^%VVIDEO G:Y3="" NLI
 Q:Y3=""
 I '($$IR^%QSGEST5("L0",Y3)) D ^%VZEAVT($$^%QZCHW("Liste inconnu")) G NLI
SUITE S BOOL=1 D INIT Q:'(BOOL)
 D POCLEPA^%VVIDEO W $$^%QZCHW("Impression en cours...")
 S LIM=$S($D(^IMPRCOUR(WHOIS)):^IMPRCOUR(WHOIS)-5,1:60),IMP=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
 O IMP U IMP D IMPRI^%QAX(SAVI),ZD^%QMDATE4,^%QMDAK0
 D IMPR C IMP D ^%VZEAVT("Impression terminee") Q
LIST 
 D CLEPAG^%VVIDEO,INIT^%QUCHOIP("^[QUI]QSETAT",1,"",0,3,79,18),AFF^%QUCHOIP S Y2=$$UN^%QUCHOIP D END^%QUCHOIP,CLFEN^%VVIDEO(0,3,18,79) G:Y2="" NET
 G NLI
 
INIT 
 S ETAT=Y2,NL=Y3,CONT=^[QUI]QSETAT(ETAT),TITRE=$P(CONT,"^",1),COM1=$P(CONT,"^",2),COM2=$P(CONT,"^",3),COM3=$P(CONT,"^",4),COM4=$P(CONT,"^",5),REP=$P(CONT,"^",6),LA=$P(CONT,"^",7)
 S BASE=$$^%QSCALVA("L0",NL,"BASE"),TRI=$S($$^%QSCALVA("L0",NL,"TRIABLE")="OUI":1,1:0)
 I BASE'=REP D ^%VZEAVT($$^%QZCHW("Cette liste ne contient pas des ")_REP) S BOOL=0 Q
 S LISTE=$S(TRI:$$^%QSCALVA("L0",NL,"TRIEE"),1:$$^%QSCALVA("L0",NL,"ADRESSE"))
 I LISTE="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver la liste")) S BOOL=0 Q
 I LA'="",'($D(^[QUI]QSETATR(ETAT))) D ^%VZEAVT($$^%QZCHW("Les attributs n'ont pas de caracteristiques")) S BOOL=0 Q
 S CPT=0 I LA'="" S NF="" F I=1:1 S NF=$O(^[QUI]QSETATR(ETAT,NF)) Q:NF=""  S LATTR=^[QUI]QSETATR(ETAT,NF) F IP=1:3:15 D TOTPOS
 S PAGE=1 Q
TOTPOS 
 S ATR=$P(LATTR,"^",IP),Y1=$P(LATTR,"^",IP+1),Y2=$P(LATTR,"^",IP+2)
 S CPT=CPT+1,TAB(CPT)=ATR,TAB2(CPT)=$$^%QZCHEV($$MIN^%VMINUSC(ATR),Y1,"P"),CAR(CPT)=$S(Y1="":20,1:Y1),CAR2(CPT)=$S(Y2="":"N",1:Y2),TOT(CPT)=0 Q
IMPR 
 D ENTET,CORPS Q
ENTET 
 W #,!,$$^%QZCHW("Le : "),%DAT,$$^%QZCHW(" a : "),HEURE,!,!
 W ?30,$$^%QZCHW("Titre : "),TITRE,?100,$$^%QZCHW("Page : "),PAGE,!
 W !,?15,COM1,?70,COM2,!,?15,COM3,?70,COM4,!,!
 W ?5,$$^%QZCHW("Individu") S LL=21
 F J=1:1:CPT W ?LL,TAB2(J) S LL=(LL+CAR(CPT))+1
 W !,! S NBRL=11 Q
CORPS 
 I TRI S II="" F %I=0:0 S II=$O(@LISTE@(II)) Q:II=""  S I=@LISTE@(II) W $E($$S^%QAX(I),1,20) D IMPRATT
 I '(TRI) S I="" F %I=0:0 S I=$O(@LISTE@(I)) Q:I=""  W $E($$S^%QAX(I),1,20) D IMPRATT
 D IMPTOT Q
IMPRATT 
 S LL=21 F J=1:1:CPT S ATT=TAB(J),L=CAR(J),VAL=$E($$^%QSCALVA(BASE,I,ATT),1,L) W ?LL,VAL S LL=(LL+L)+1 I CAR2(J)="O" S TOT(J)=TOT(J)+VAL
 W ! S NBRL=NBRL+1 Q:(NBRL'=LIM)-3
 D IMPTOT Q
IMPTOT 
 W ! S LL=21 F J=1:1:CPT S T=TOT(J),L=CAR(J) W:T'=0 ?LL,$TR($J("",L)," ","-") S LL=(LL+L)+1
 W ! S LL=21 F J=1:1:CPT S T=TOT(J) W:T'=0 ?LL,T S LL=(LL+CAR(J))+1
 S PAGE=PAGE+1 D ENTET Q

