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

;%QS0LEC2^INT^1^59547,73879^0
QS0LEC2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DEB N %I,ATR,BASE,CPT,I,IMP,J,L,LISTE,LL,TAB,TRI,TYP,TI,INDI,BOOL,SAVI
 S BOOL=REP="",SAVI=$I
 S BASE=$$BASE^%QSGEST7(NL),TYP=$$TYP^%QSGEST7(NL),CPT=0
 S TRI=$S($$^%QSCALVA("L0",NL,"TRIABLE")="OUI":1,1:0)
 I (BASE="")&(LISTA'="") D ^%VZEAVT($$^%QZCHW("Impossible de retrouver la base des individus")) Q
 S LISTE=$S(TRI:$$ADRLT^%QSGEST7(NL),1:$$ADRLIS^%QSGEST7(NL))
 I LISTE="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver la liste")) Q
 I TYP'="INDIVIDU" G IMP
 I REP="" D POCLEPA^%VVIDEO S REP=$$^%VZECH2($$^%QZCHW("Avec quels attributs ? "),$$^%QZCHW("Ceux de la liste"),$$^%QZCHW("tous")) G:REP=-1 FIN
 I REP="tous" D IMPR2^%QS0LIMP(LISTE,BASE,TRI) G FIN
 
 G:LISTA="" IMP
 
 I ATTR S ATR=LISTA,L=20,TI=LISTA,INDI=$$GETLBLAN^%VTLBLAN($P($P(ATR,"(",2),")")) D TTAB G IMP
 I LISTA'="*" D CONSTAB G IMP
 D IMPR2^%QS0LIMP(LISTE,BASE,TRI)
 G FIN
 
IMP D POCLEPA^%VVIDEO S RM=$$^%VZECH2($$^%QZCHW("nombre de caracteres d'impression"),80,132) I (RM'=80)&(RM'=132) S RM=80 G FIN
 S LL=$S(RM=132:130,1:75) F I=1:1:CPT S LL=LL-TAB(I,"L")
 I LL>$S(RM=132:100,1:70) S LL=$S(RM=132:100,1:70)
 I LL<0 D ^%VZEAVT($$^%QZCHW("La somme des longueurs des attributs est superieure a")_" "_RM_" "_$$^%QZCHW("caracteres")) Q
 D MSG^%VZEATT($$^%QZCHW("Impression en cours")_"...")
 S IMP=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
 I '(DTM) O IMP:(RM) U IMP:(RM)
 I DTM O IMP U IMP
 D IMPRI^%QAX(SAVI)
 D ENTET,CORPS
 C IMP S RM=80
 I BOOL=1 D ^%VZEAVT($$^%QZCHW("Impression terminee"))
 
FIN D POCLEPA^%VVIDEO Q
 
CONSTAB 
 N GL S GL=$$LIST^%QMLILA(LISTA)
 F I=1:1 Q:'($D(@GL@(I)))  S ATR=@GL@(I),TI=$$TITRE^%QMLILA(LISTA,I),L=$$LONG^%QMLILA(LISTA,I),INDI=$$INDICE^%QMLILA(LISTA,I) D TTAB
 Q
TTAB 
 Q:'($$AR^%QSGEST5(BASE,$$GETLBLAN^%VTLBLAN($P(ATR,"("))))
 Q:'($$CONT(ATR))
INST S CPT=CPT+1,TAB(CPT)=$$GETLBLAN^%VTLBLAN($P(ATR,"("))
 S TAB(CPT,"I")=INDI,TAB(CPT,"L")=L,TAB(CPT,"T")=TI
 Q
 
ENTET 
 D ZD^%QMDATE4,^%QMDAK0
 W #,!,$$^%QZCHW("Le")," ",%DAT," ",$$^%QZCHW("a")," ",HEURE,!,!
 W ?$S(RM=132:50,1:30),$$^%QZCHW("Liste")," : ",NL,!,!,$E($$^%QZCHW("Individu"),1,LL)
 S L=LL+1
 F J=1:1:CPT W ?L,$$^%QZCHEV($$MIN^%VMINUSC(TAB(J,"T")),TAB(J,"L"),"P") S L=(L+TAB(J,"L"))+1
 W !,! Q
 
CORPS 
 N ATT,II,VAL,OORD
 I TRI S II="" F %I=0:0 S II=$O(@LISTE@(II)) Q:II=""  S I=@LISTE@(II) D IMPA
 I '(TRI) S I="" F %I=0:0 S I=$O(@LISTE@(I)) Q:I=""  D IMPA
 W # Q
IMPA 
 W $E($$S^%QAX(I),1,LL)
 F J=1:1:CPT S ATT=TAB(J),L=$S(J=1:LL,1:L+TAB(J-1,"L"))+1 I $$AIR^%QSGEST5(BASE,I,ATT) S OORD=TAB(J,"I"),VAL=$$AFFI^%QMDAUC(BASE,ATT,$$^%QSCALIN(BASE,I,ATT,OORD)) W ?L,$E(VAL,1,TAB(J,"L"))
 W ! Q
 
CONT(A) 
 N P1
 S P1=$P(A,".")
 Q (P1'="LIEN")&(P1'="INVERSE")
 
 
EXT(NL,LISTA,ATTR,REP) 
 G DEB

