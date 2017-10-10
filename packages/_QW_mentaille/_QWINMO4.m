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

;%QWINMO4^INT^1^59547,73886^0
%QWINMO4() 
 
 
 
 
 
 
 N ADRES,CONTR,CTRLA,I,L,LR,MN,O,OOKK,RB,RI,SYN,UN,Y,RP
 D POCLEPA^%VVIDEO
 S O=PIL(PIL-1),OOKK=0
 S RI=$$NOMLOG^%QSF(REPI),RB=$P(O,"^",2),I=$P(O,"^",5)
 
 S MN(1)="Ajouter^AJOUT"
 S MN(2)="Supprimer^SUPPR",LR=1,LM=3 K LOPT
 G:'($D(^[QUI]RQSQUAL(RB,RATT))) LIENINV
 S A="LIEN."_RATT,RP=RB
 D INSMEN2
LIENINV S LR=LR+1,L=$P(^[QUI]RQSILIEN(RB,REPI,$$TYPE^%QSGEST9(RB,RATT),RATT),"^",2)
 G:'($D(^[QUI]RQSQUAL(REPI,L))) LISTR
 S RP=REPI,A="LIEN."_L D INSMEN2
LISTR 
 S L=$$TEMP^%SGUTIL
 D LISTVAL^%QSTRUC8(RB,I,RATT,L)
 S LR=$$LISTIND^%QSGEST6(REPI)
DEB D:OOKK END^%QUCHOIP D NET
 I '($$AIR^%QSGEST5(RB,I,RATT)) S OOKK=0 G SEL
 S OOKK=1 D INIT2^%QUCHOIP(L,1,"",0,YBA,LFDR,HFBA-1,LECR)
 
AFF D NET I OOKK D AFF^%QUCHOIP S FDM=1
 
SEL 
ACT S CONTR="",ADRES=""
 S DX=0,DY=22 X XY D CLEBAS^%VVIDEO
 D ^%VQUIKMN(0,79,22,"MN",.ADRES,.CONTR)
 S DX=0,DY=22 X XY D CLEBAS^%VVIDEO
 G:ADRES'="" SADR
 I "AF"[CONTR G END
 D ^%VSQUEAK G ACT
SADR G:(ADRES="AJOUT")!(ADRES="SUPPR") @ADRES
 G LIEN
END D:OOKK END^%QUCHOIP
 Q 1
LIEN 
 I ('(OOKK))!('($$AIR^%QSGEST5(RB,I,RATT))) D ^%VSQUEAK G SEL
 S UN=$$UN^%QUCHOIP G:UN="" SEL
 S UN=$$M^%QAX(UN),CH=LOPT(ADRES),RAATT=$P(CH,"^",3)
 
 I $P(CH,"^",4)=1 S RIIND=$$NOML^%QSGES20(I,UN,$P(RAATT,".",2,999),UN) G LIENS
 S RIIND=$$NOML^%QSGES20(UN,I,$P(RAATT,".",2,9999),I)
LIENS D ^%QSINDIV(MODEL,$$LIENI^%QSGEL3,RIIND,0,YBA,HFBA,LFDR,LECR)
 G DEB
AJOUT 
 D NET S DX=0,DY=23 X XY S Y1=$$^%VZAME1($$^%QZCHW("Individu : "))
 S FDMI=1 G:CTRLA!(Y1="") AFF G:Y1'="?" AJTEST
 I $$REPVID^%QSGEST5(REPI) D M^%QSAJCM4($$^%QZCHW("Aucun(e) ")_$$^%QZCHW(REP)_$$^%QZCHW(" actuellement")),NET G SEL
 D INIT2^%QUCHOIP(LR,1,"",0,YBA,LFDR,HFBA,LECR)
 D AFF^%QUCHOIP
SEL0 S Y1=$$UN^%QUCHOIP,FDM=1 D END^%QUCHOIP G:Y1="" AFF
AJTEST S SYN=$$M^%QAX(Y1)
 G:$$IR^%QSGEST5(REPI,SYN) REL
 D M^%QSAJCM4(REP_" inconnu") G AFF
REL G:'($D(@L@(SYN))) RELR
 D POCLEPA^%VVIDEO,^%VSQUEAK
 I '($$MES^%VZEOUI("Liaison deja existante. Recreation du lien ?","N")) S FDM=1 G AJOUT
 
RELR D ^%VZEATT
 D ADDS^%QSGEST3($P(O,"^",2),$P(O,"^",5),RATT,REPI,SYN)
 D POCLEPA^%VVIDEO G DEB
SUPPR 
 I ('(OOKK))!('($$AIR^%QSGEST5(RB,I,RATT))) D ^%VSQUEAK G SEL
 S UN=$$UN^%QUCHOIP G:UN="" SEL
 D ^%VZEATT,SUPS^%QSGEST3($P(O,"^",2),$P(O,"^",5),RATT,REPI,$$M^%QAX(UN))
 D POCLEPA^%VVIDEO
 G DEB
 
NET I FDM D CLFDR^%QSAJCM4 S FDM=0,FDMI=0
 I FDMI D CLIND^%QSAJCM4 S FDMI=0
 Q
AJOUTL N O,RB,A,L,CH,RA
 S O=PIL(PIL-1)
 S RB=$P(O,"^",2)
 S RA=$P(PIL(PIL-1),"^",7)
 G:'($D(^[QUI]RQSQUAL(RB,RA))) AJOUTLS
 S A="LIEN."_RA
 S O=$P(O,"^",5) D INSMEN
AJOUTLS S L=$P(^[QUI]RQSILIEN(RB,REPI,$$TYPE^%QSGEST9(RB,RA),RA),"^",2)
 Q:'($D(^[QUI]RQSQUAL(REPI,L)))
 S RB=REPI,A="LIEN."_L,O=INDIV D INSMEN
 Q
INSMEN S CH=^[QUI]RQSLIEN(RB,A),J=$P(CH,"^",1)
 Q:(J=1)!(J=5)
 S LIB=$P(CH,"^",2),LIBT=$$^%QZCHW($$NOMLOG^%QSF(LIB))
 I (LONGM+$L(A))>128 S ^M($J,I)=$$^%QZCHW("Suite")_"^SUIT",SAUV=$ZP(^[QUI]RQSLIEN(REPI,A)),STOP=1 Q
 S I=I+1,^M($J,I)=A_"^"_I,LOPT(I)=LIB_"^"_J_"^"_A_"^"_RB_"^"_O
 S LONGM=(LONGM+$L(A))+2 Q
INSMEN2 S CH=^[QUI]RQSLIEN(RP,A),J=$P(CH,"^",1)
 Q:(J=1)!(J=5)
 S LIB=$P(CH,"^",2),LIBT=$$^%QZCHW($$NOMLOG^%QSF(LIB))
 S MN(LM)=A_"^"_LM,LOPT(LM)=LIB_"^"_J_"^"_A_"^"_LR
 S LM=LM+1 Q
