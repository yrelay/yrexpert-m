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

;%QSMODEL^INT^1^59547,73882^0
%QSMODEL(NET,M,QUI,WH) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N C,F,%F,I,J,L,L2,N,%N,NI,NC,P,%P,PERE,%R,%U,R,R2,RI,RI2
 N GL1,GL2,GL3,GL4,GL,GLAUT,REPCR,NINJ,%ST,LLEX
 K ^[QUI]RQSDON("REMSIG")
 S LLEX=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MOT.RES")
 K @(LLEX)
 I '($D(^TABIDENT(WH))) D ^%VZEAVT($$^%QZCHW("Le service")_" "_WH_" "_$$^%QZCHW(" n'est pas repertorie ")) Q
 I '($D(^RQSMOD(M))) D COPMOD^%QSMODE2 I '($D(^RQSMOD(M))) D ^%VZEAVT($$^%QZCHW("Le schema de donnees")_M_$$^%QZCHW(" n'est pas repertorie ")) Q
 I '($D(^RQSMDL9("CARACT",M,"OKVERIF"))) G BADMOD
 I ^RQSMDL9("CARACT",M,"OKVERIF")=1 G SM1
BADMOD D ^%VZEAVT($$^%QZCHW("Le schema de donnees")_M_$$^%QZCHW(" n'a pas ete verifie ou est incorrect"))
 I $$MES^%VZEOUI($$^%QZCHW("Voulez-vous neanmoins continuer ?"),"N")'=1 Q
SM1 I '($D(^RQSMOD2(M))) D ^%VZEAVT($$^%QZCHW("Veuillez definir le repertoire par defaut")) Q
 S NINJ=QUI'=$$^%QCSDIR
 I NINJ F GL="^[QUI]RQS3","^[QUI]RQS4" D KILLPDP(GL)
 S ^[QUI]RQSMODIN($H)=M
 D:NET NET^%QSMODE2(QUI,WH)
 S:NINJ ^[QUI]RQSMOD(M)=^RQSMOD(M)
 S GL1="^RQSMDL1",GL2="^RQSMDL2"
 S GL3="^RQSMDL3",GL4="^RQSMDL4",GLAUT="^RQSMOD3"
 
 
 
 
 
 
 
 
 S R=-1 F %R=0:0 S R=$N(@GL1@(M,R)) Q:R=-1  D TR
 
 S R=-1 F %R=0:0 S R=$N(@GL2@(M,R)) Q:R=-1  S L=-1 F %U=0:0 S L=$N(@GL2@(M,R,L)) Q:L=-1  D T1^%QSMODE2
 
 S R=-1 F %R=0:0 S R=$N(@GL3@(M,R)) Q:R=-1  S L=-1 F %U=0:0 S L=$N(@GL3@(M,R,L)) Q:L=-1  D T2^%QSMODE2
 
 S R=-1 F %R=0:0 S R=$N(@GL4@(M,R)) Q:R=-1  S L=-1 F %U=0:0 S L=$N(@GL4@(M,R,L)) Q:L=-1  D T3^%QSMODE2
 S I=-1 F %P=0:0 S I=$N(PERE(I)) Q:I=-1  D PERE(I,I)
 S ^[QUI]RQSDEFAU=^RQSMOD2(M)
 S:NINJ ^[QUI]RQSDEFAU=^RQSMOD2(M)
 
 G:'(NINJ) INJEC1
 S R=-1 F %R=0:0 S R=$N(^RQSMOD3(M,R)) Q:R=-1  S ^RQSAUTOR(WH,R)="",^[QUI]RQSAUTOR(WH,R)="",^[QUI]RQSMOD3(M,R)=""
 D ADR^%QCAGLC("^RQSMOD4("""_M_"""","^["""_QUI_"""]RQSMOD4("""_M_"""")
 D ADR^%QCAGLC("^RQSMOD5("""_M_"""","^["""_QUI_"""]RQSMOD5("""_M_"""")
 D ADR^%QCAGLC("^RQSMOD7("""_M_"""","^["""_QUI_"""]RQSMOD7("""_M_"""")
 D ADR^%QCAGLC("^RQSMOD8("""_M_"""","^["""_QUI_"""]RQSMOD8("""_M_"""")
 G FINSI1
INJEC1 S R=-1 F %R=0:0 S R=$N(^RQSMOD3(M,R)) Q:R=-1  S ^RQSAUTOR(WH,R)=""
FINSI1 
 S R=-1 F %R=0:0 S R=$N(@GL1@(M,R)) Q:R=-1  S @LLEX@("REP",R)="  "_$$^%QZCHW("Repertoire du schema de donnees")_" "_M D VIS^%QSDROIT($$NOMINT^%QSF(R),"NOM")
 D CARD^%QSMODE2
 
 D ^%QSMODE3(M,GL1)
 
 D LQUAL^%QSMODE2(QUI)
 
 
 N TLIEN
 S TLIEN=$$TLIEN^%QSGES21
 D:'($D(@TLIEN)) TCOP^%QSGES21
 D SYSTEME^%QSMODE3
 
 D:NET SUPPRTO^%LXMRINS(1) D:'(NET) SUPPRSY^%LXMRINS(1)
 
 D DIRECT^%LXMRINS
 D ^%QSGESPI
 S F="",L=$$^%QZCHW("Mot reserve :")
 F %F=0:0 S F=$O(@LLEX@("REP",F)) Q:F=""  I '($D(@LLEX@("LIEN",F))) D STOCK^%LXMRINS(F,L_"^"_@LLEX@("REP",F)_"^^^^^"),STOCK^%LXAJMOD(F,L,@LLEX@("REP",F),"","","","","","")
 S F=""
 F %F=0:0 S F=$O(@LLEX@("LIEN",F)) Q:F=""  S C="" S:$D(@LLEX@("REP",F)) C=@LLEX@("REP",F) D STOCK^%LXMRINS(F,L_"^"_@LLEX@("LIEN",F)_"^"_C_"^^^^"),STOCK^%LXAJMOD(F,L,@LLEX@("LIEN",F),C,"","","","","")
 K @(LLEX)
 Q
PERE(P,PC) N F,%F,FI S F=-1 F %F=0:0 S F=$N(PERE(PC,F)) Q:F=-1  S FI=$$NOMINT^%QSF(F),^[QUI]RQSPERE(P,FI)="",^[QUI]RQSFILS(FI,P)="" D PERE(P,FI)
 Q
 
TR S C=@GL1@(M,R),J=1
 S:NINJ ^[QUI]RQSMDL1(M,R)=C
 F I="NI","NC" S @I=$P(C,"^",J),J=J+1
 S ^[QUI]RQSNOLOG(R)=NI
 S ^[QUI]RQSNOINT(NI)=R
 S ^[QUI]RQSNCLES(NI)=NC
 Q
QUAL(RI,L,QL,RI2,L2,QL2) 
 S:QL="O" ^[QUI]RQSQUAL(RI,L)=""
 S:QL2="O" ^[QUI]RQSQUAL(RI2,L2)=""
 Q
 
MODEL() N CLE S CLE=$ZP(^[QUI]RQSMODIN("z")) Q:CLE="" "" Q ^[QUI]RQSMODIN(CLE)
 
ERMODEL() Q $$^%QZCHW("Aucun schema de donnees n'est disponible sur cette partition")
 
TEST N M,N,Q,W
 D CLEPAG^%VVIDEO
 W !,"  Installation d'un schema de donnees sur la partition donnees"
 W !,"             d'un utilisateur (O/N) ? [O] : "
 R *DX:^TOZE($I,"ATTENTE") G:(DX=13)!(DX=79) OK D ^%VSQUEAK Q
OK W !,"Nettoyage ancien schema (O/N) : " R N Q:N=""
 W !,"Schema de donnees a installer     : " R M Q:M=""
TT1 S DY=5,DX=0 X XY W "QUI de l'utilisateur   : " R Q G:Q="" OK
 I '($$EXIST^%QCSCDIR(Q)) D ^%VZEAVT("La partition "_Q_" est inexistante") G TT1
 
TT2 W !,"WHOIS de l'utilisateur : " R W G:W="" TT1
 D ^%QSMODEL(N="O",M,Q,W) Q
 
KILLPDP(G) 
 N I,U Q:'($D(@G))
 S I="" F U=0:0 S I=$O(@G@(I)) Q:I=""  Q:I="z"  K @G@(I)
 Q

