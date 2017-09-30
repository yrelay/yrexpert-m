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

;%QMNF10^INT^1^59547,73879^0
%QMNF10 ;
 
 
 
 
MAJ 
 N REPLI,INDLIEN,REP,BASI,REPD,BASID,IND,IND2,OK,LIEN
 N TEMP,GLOBAL,NOMENC,TABLE,TABLE2,TYP,TOTAL,MN1,AD,CONTR,ABENDSCR,SCR
 N CMS,CPT,CPTS,RETOUR,DIAL,Y1,PROFMX,ATT,I,%ABORT
 
 N B,%B,LBASE,LLIEN,INTER,MODEL
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GLOBAL=$$CONCAS^%QZCHAD(TEMP,"GLOBAL")
 S NOMENC=$$CONCAS^%QZCHAD(TEMP,"NOMENC")
 S LBASE=$$CONCAS^%QZCHAD(TEMP,"LISTE.BASE")
 S LLIEN=$$CONCAS^%QZCHAD(TEMP,"LISTE.LIEN")
 S MN1=$$CONCAS^%QZCHAD(TEMP,"MENU")
 D MENU^%QMNF2(MN1)
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("Liens de structure"))
 
 D REP^%QMNF2(.OK)
TEST I '(OK) K @(TEMP) Q
MAJ2 I '($$CONS^%QMNF2) D IND^%QMNF2(.OK) G TEST
 
 S BASID=$$REPD^%QSGEL2(BASI,LIEN),REPD=$$NOMLOG^%QSF(BASID)
 D CLEPAG^%VVIDEO
 S CMS=0,CPT=1,RETOUR="CONS3",DIAL="DIAL2"
AFFG1 
 S SCR="QMNFNO1"
 Q:'($D(^%SCRE(SCR)))
 K RESUL
 S RESUL(1)=REP,RESUL(2)=LIEN,RESUL(3)="MISE A JOUR"
 D ^%VAFIGRI,^%VAFISCR
 
 S SCR="QMNFNO2"
 Q:'($D(^%SCRE(SCR)))
 K RESUL
 S RESUL(1)=LIEN,RESUL(2)=REP,RESUL(3)=$$S^%QAX(IND)
 S RESUL(4)=REPD,IND2=@GLOBAL@(CPT),RESUL(5)=$$S^%QAX(IND2)
CONS3 D ^%VAFIGRI,^%VAFISCR,FEN
 
DIAL2 D ^%VQUIKMN(0,80,22,MN1,.AD,.CONTR)
 I (CONTR="A")!(CONTR="F") D REAFF^%QMNF2,IND^%QMNF2(.OK) G TEST
 I AD'="" G @AD
 G DIAL2
 
NUM D POCLEPA^%VVIDEO
 S Y1=$$^%VZAME1($$^%QZCHW("Numero")_" : ")
 I Y1="" D POCLEPA^%VVIDEO G @RETOUR
 I '($D(@GLOBAL@(Y1))) D ^%VZEAVT($$^%QZCHW("Inconnu")_"...") G NUM
 S CPT=Y1,IND2=@GLOBAL@(CPT),RESUL(5)=$$S^%QAX(IND2)
 D POCLEPA^%VVIDEO G @RETOUR
 
SUIV 
 S CPTS=CPT,CPT=$O(@GLOBAL@(CPT))
 I CPT="" D ^%VZEAVT($$^%QZCHW("Recherche epuisee")_"...") S CPT=CPTS G @DIAL
 S IND2=@GLOBAL@(CPT),RESUL(5)=$$S^%QAX(IND2) G @RETOUR
 
PREC 
 S CPTS=CPT,CPT=$ZP(@GLOBAL@(CPT))
 I CPT="" D ^%VZEAVT($$^%QZCHW("Recherche epuisee")_"...") S CPT=CPTS G @DIAL
 S IND2=@GLOBAL@(CPT),RESUL(5)=$$S^%QAX(IND2) G @RETOUR
 
ATT 
 I '($$QUAL^%QSGEL2(REP,LIEN)) D ^%VZEAVT($$^%QZCHW("Lien non qualifie")_"...") G @DIAL
 S REPLI=$$LIENI^%QSGEL3
 S INDLIEN=$$NOML1^%QSGES20(IND,IND2,LIEN,IND2)
 
 S TABLE2=$$CONCAS^%QZCHAD(TEMP,"ATTRIBUTS.NON.AUTOR") K @(TABLE2)
 S TABLE=$$CONCAS^%QZCHAD(TEMP,"ATTRIBUTS") K @(TABLE)
 D PATOUCH^%QSGES19(.TABLE2)
 
 D RIA^%QSGE1(REPLI,INDLIEN,.TABLE)
 S ATT="" F I=0:0 S ATT=$O(@TABLE2@(ATT)) Q:ATT=""  K @TABLE@(ATT)
 D ATPR(REPLI,INDLIEN,.TABLE)
 S ATT=""
 F I=1:1 S ATT=$O(@TABLE@(ATT)) Q:ATT=""  S @TABLE@(I,ATT)="" K @TABLE@(ATT)
 
 D CLEPAG^%VVIDEO,^%VZCD0(INDLIEN)
 D SELECT^%QSATTRI(INDLIEN,REPLI,0,6,79,16,TABLE)
 K @(TABLE),@(TABLE2)
 D CLEPAG^%VVIDEO G AFFG1
 
ARB 
 K @(NOMENC)
 
 D ^%QMNF4(BASI,IND,LIEN,NOMENC,.PROFMX) I %ABORT G ARB2
 D ^%QMNF5(NOMENC,BASI,IND,LIEN,PROFMX)
 D CLEPAG^%VVIDEO H 1
ARB2 K @(NOMENC)
 D POCLEPA^%VVIDEO G AFFG1
 
FEN 
 S DX=27,DY=20 X XY W " "_$$^%QZCHW("Numero")_" : "_CPT_"/"_TOTAL_" " Q
 
DEL 
 S TYP=$$TYPE^%QSGEST9(BASI,LIEN)
 I (TYP=1)!(TYP=2) D ^%VZEAVT($$^%QZCHW("Lien hierarchique impossible a supprimer...")) G @RETOUR
 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous vraiment supprimer ce lien")_" ? ")'=1 D POCLEPA^%VVIDEO G @DIAL
 D ^%VZEATT,SUPS^%QSGEST3(BASI,IND,LIEN,BASID,IND2) K @GLOBAL@(CPT)
 S TOTAL=TOTAL-1,CPTS=CPT
 I CPTS>TOTAL S CPTS=CPTS-1 G DEL2
 F I=0:0 S CPT=$O(@GLOBAL@(CPT)) Q:CPT=""  S @GLOBAL@(CPT-1)=@GLOBAL@(CPT) K @GLOBAL@(CPT)
DEL2 S CPT=CPTS,IND2=$S(TOTAL=0:"",1:@GLOBAL@(CPT)),RESUL(5)=$$S^%QAX(IND2)
 D POCLEPA^%VVIDEO G @RETOUR
 
FIN F I=1:1:3 D END^%QUCHOI6
 K @(TEMP) Q
 
ATPR(REPL,INDL,TABLE) 
 N ATB,V1,TAB,I,ATR,BASLI,OO
 S BASLI=$$NOMLOG^%QSF(REPL)
 S ATB=$O(^[QUI]RQSATPR(BASLI,""))
 I ATB'="*" S ATB="" G BAT
 D ATPRALL
BAT S ATB=$O(^[QUI]RQSATPR(BASLI,ATB))
 G:ATB="" ATTNOM
 G:ATB="NOM" BAT
 S OO=""
BV1 S OO=$$NXTRIAO^%QSTRUC8(REPL,INDL,ATB,OO)
 G:OO="" BAT
 S V1=$$VALEUR^%QSTRUC8(REPL,INDL,ATB,OO)
 D ^%QSATPR(BASLI,ATB,V1,.TAB)
 S I=0
BV2 S I=I+1
 S ATR=$O(TAB(I,""))
 G:ATR="" BV3
 I $D(@TABLE@($P(ATR,"("))) G BV2
 S @TABLE@(ATR)=""
 I TAB(I,ATR)'="",'($$AIR^%QSGE5(REPL,INDL,ATR)) D PA^%QSGESTI(REPL,INDL,ATR,TAB(I,ATR),1)
 G BV2
 
BV3 K TAB
 G BV1
ATTNOM 
 D ^%QSATPR(BASLI,"NOM",$$^%QSCALVA(REPL,INDL,"NOM"),.TAB)
 F I=1:1 S ATR=$O(TAB(I,"")) Q:ATR=""  S @TABLE@(ATR)=""
 K TAB
 Q
ATPRALL 
 D ALL^%QSATPR(BASLI,.TAB)
 F I=1:1 S ATR=$O(TAB(I,"")) Q:ATR=""  S @TABLE@(ATR)=""
 K TAB
 Q

