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

;%QS0LIMP^INT^1^59547,73879^0
%QS0LIMP ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N BASE,GLOB,LISTE,TRI,Y1
 D TITRE("IMPRESSION D'UNE LISTE")
QUES S DX=10,DY=12 D CLEBAS^%VVIDEO
 S Y1=$$^%VZAME1("Liste a imprimer : ") G:Y1="?" LIST Q:Y1=""
 I '($$IR^%QSGEST5("L0",Y1)) D ^%VZEAVT($$^%QZCHW("Cette liste n'existe pas")) G QUES
 S LISTE=Y1
TEST S TRI=$S($$^%QSCALVA("L0",LISTE,"TRIABLE")="OUI":1,1:0),BASE=$$^%QSCALVA("L0",LISTE,"BASE")
 S GLOB=$S(TRI:$$^%QSCALVA("L0",LISTE,"TRIEE"),1:$$^%QSCALVA("L0",LISTE,"ADRESSE"))
 I BASE="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver la base des individus ... ")) Q
 I GLOB="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver la liste ... ")) Q
 D IMPR(GLOB,BASE,TRI) Q
 
LIST 
 D TITRE("LISTES")
 D INIT^%QUCHOIP($$LISTIND^%QSGEST6("L0"),1,"",0,6,80,16),AFF^%QUCHOIP S Y1=$$UN^%QUCHOIP
 D TITRE("IMPRESSION D'UNE LISTE")
 S DX=10,DY=12 X XY W $$^%QZCHW("Liste a imprimer : ") G:Y1="" QUES W Y1 S LISTE=Y1 G TEST
 
TITRE(MSG) 
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW(MSG))
 Q
 
 
 
IMPR2(GLOB,BASE,TRI) 
 
 N TSORD
 S TSORD=1
 G IMP2
 
 
 
IMPR(GLOB,BASE,TRI) 
 N TSORD
 S TSORD=0
IMP2 N %A,%C,%I,A,ARRET,COD,CS,GL,I,II,IMP,PAGE,REP
 D ZD^%QMDATE4,^%QMDAK0,MSG^%VZEATT($$^%QZCHW("Impression en cours ... "))
 S IMP=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0) O IMP U IMP
 S ARRET=0,CS=^TOZE($I,"CODSYN"),PAGE=0
 I TRI S II="" F %I=0:0 S II=$O(@GLOB@(II)) Q:II=""  S I=@GLOB@(II) D ENTET,CORPS Q:ARRET=1
 I '(TRI) S I="" F %I=0:0 S I=$O(@GLOB@(I)) Q:I=""  D ENTET,CORPS Q:ARRET=1
 C IMP S ^TOZE($I,"CODSYN")=CS
 D ^%VZEAVT($$^%QZCHW("Impression terminee ... ")) Q
 
ENTET 
 S PAGE=PAGE+1
 W #,!,$$^%QZCHW("Le : "),%DAT,$$^%QZCHW(" a : "),HEURE,?60,$$^%QZCHW("Page : "),PAGE,!,!
 Q
 
CORPS 
 W ?10,$$^%QZCHW("Individu : "),I,!,!,?30,$$^%QZCHW("Synonymes : ")
 S COD=""
 F %C=0:0 S COD=$O(^[QUI]ZSYNONY(COD)) Q:COD=""  D IMPC
 W !,!,?20,$$^%QZCHW("Attributs"),?50,$$^%QZCHW("Valeurs")
 S A="",GL=$$LISTATT1^%QSGEST6(BASE,I)
 F %A=0:0 S A=$O(@GL@(A)) Q:A=""  I $$CONT D IMPA
 U 0 R *ARRET:0 D TOUCHE^%INCCLAV(ARRET,.ARRET) I ARRET'=1 U IMP Q
 S REP=$$MES^%VZEOUI("Voulez-vous interrompre l'impression ? ","N") S:REP'=1 ARRET=0 U IMP
 Q
 
IMPC S ^TOZE($I,"CODSYN")=COD Q:$$S^%QAX(I)=I
 W ?42,$$S^%QAX(I),$$^%QZCHW("   (Code : "),COD,")",!
 Q
IMPA N ESTL,VAT,OAT,LOAT
 S ESTL=0
 S:$D(^[QUI]RQSLIEN(BASE,A)) ESTL=1
 I TSORD=0 W !,?10 W:ESTL "(L)" W ?15,A,?45,$$AFFI^%QMDAUC(BASE,A,$$^%QSCALVA(BASE,I,A)) Q
 S OAT=""
IMPABO S OAT=$$NXTRIAO^%QSTRUC8(BASE,I,A,OAT) Q:OAT=""
 S VAT=$$VALEUR^%QSTRUC8(BASE,I,A,OAT)
 S LOAT=$S(OAT=1:"",1:"("_OAT_")")
 W !,?10 W:ESTL "(L)" W ?15,A_LOAT,?45,$$AFFI^%QMDAUC(BASE,A,VAT)
 G IMPABO
 
CONT() 
 N P1
 S P1=$P(A,".")
 Q (P1'="LIEN")&(P1'="INVERSE")

