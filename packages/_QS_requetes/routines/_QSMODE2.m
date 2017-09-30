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

;%QSMODE2^INT^1^59547,73882^0
%QSMODE2 ;
 
 
 
 
 
 
 
 
 
 
 
LQUAL(QUI) 
 N I,U,R,L,LIEN,INV,J,REPD
 S R=""
 F I=1:1 S R=$O(^[QUI]RQSQUAL(R)) Q:R=""  S L="" F U=1:1 S L=$O(^[QUI]RQSQUAL(R,L)) Q:L=""  D CRL
 Q
CRL 
 S LIEN="LIEN."_L,INV="SOURCE."_L
 
 Q:$D(^[QUI]RQSLIEN(R,LIEN))
 N LIENI
 S LIENI=$$LIENI^%QSGEL3
 S ^[QUI]RQSLIEN(R,LIEN)="3^"_LIENI
 S ^[QUI]RQSLIEN(LIENI,INV)="3^"_R
 S ^[QUI]RQSILIEN(R,LIENI,3,LIEN)="3^"_INV
 S ^[QUI]RQSILIEN(LIENI,R,3,INV)="3^"_LIEN
 S ^[QUI]RQSLIEN2(R,3,LIEN)=LIENI
 S ^[QUI]RQSLIEN2(LIENI,3,INV)=R
 
 S LIEN="INVERSE."_L,INV="DESTINATION."_L
 S REPD=$P(^[QUI]RQSLIEN(R,L),"^",2)
 S ^[QUI]RQSLIEN(REPD,LIEN)="3^"_LIENI
 S ^[QUI]RQSLIEN(LIENI,INV)="3^"_REPD
 S ^[QUI]RQSILIEN(REPD,LIENI,3,LIEN)="3^"_INV
 S ^[QUI]RQSILIEN(LIENI,REPD,3,INV)="3^"_LIEN
 S ^[QUI]RQSLIEN2(REPD,3,LIEN)=LIENI
 S ^[QUI]RQSLIEN2(LIENI,3,INV)=REPD
 F J=LIEN,INV,"LIEN."_L,"SOURCE."_L S @LLEX@("LIEN",J)="  "_$$^%QZCHW("Lien du schema de donnees")_" "_M
 Q
 
SUP() 
 
 N M,R
 K @(m("OLDN")),@(m("OLDF"))
 S M=RESUL(1),R=RESUL(2)
 K ^RQSMOD3(M,R)
 I $P(^RQSMOD2(M),"^")=R K ^RQSMOD2(M) D ^%VZEAVT("Il n'y a plus de repertoire par defaut ...")
 Q 1
 
EDIT(M) 
 N GL,DEB
 S GL="^RQSMDL5("""_M_""")"
 S DEB=1
 S DXG=0,DYH=7,LH=80,LV=16,BLD=1 D CARS^%VVIDEO
 D REAFF^%QULIMO3(1,1,GL,0,7,80,16)
 D ZLISTE^%QULIMO(0,7,80,16,GL,.DEB,"ADDC^%QSMODE2","SUPC^%QSMODE2")
 Q
ADDC S OK=1 Q
SUPC S OK=1 Q
 
COPMOD 
 Q:'($D(^[QUI]RQSMOD(M)))
 S ^RQSMOD(M)=^[QUI]RQSMOD(M)
 S PTROUT=$$^%QCSDIR
 D ^%QSMODCP(QUI,M,PTROUT,M,0)
 Q
 
CARD 
 N R,GL,I
 S GL="GL"
 Q:$$MODEL^%QSMODEL=""
 D REP^%QSGEST9(GL)
 S R=$O(GL(""))
 F I=0:0 Q:R=""  D:$$REPVID^%QSGEST5($$NOMINT^%QSF(R))=1 CARD^%QSREPAR($$NOMINT^%QSF(R)) S R=$O(GL(R))
 Q
 
NET(QUI,WHOIS) 
 N %G,G
 G:'(NINJ) INJEC2
 S LIB=$P($T(LIB),";;",2)
 F %G=1:1 S G="^[QUI]"_$P(LIB,"/",%G) Q:G="^[QUI]"  D KILLPDP(G)
 F G="^RQSAUTOR(WHOIS)","^[QUI]RQSAUTOR(WHOIS)" D KILLPDP(G)
 G FINSI2
INJEC2 S LIB2=$P($T(LIB2),";;",2)
 F %G=1:1 S G="^[QUI]"_$P(LIB2,"/",%G) Q:G="^[QUI]"  D KILLPDP(G)
 S G="^RQSAUTOR(WHOIS)" D KILLPDP(G)
FINSI2 
 Q
 
LIB ;;RQSDEFAU/RQSNOLOG/RQSNOINT/RQSNCLES/RQSLIEN/RQSILIEN/RQSPERE/RQSFILS/RQSMOD4L/RQSLIEN2/RQSQUAL/RQSMOD/RQSMOD2/RQSMOD3/RQSMOD4/RQSMOD5/RQSMOD7/RQSMOD8/RQSMDL1/RQSMDL2/RQSMDL3/RQSMDL4/RQSMDL5
LIB2 ;;RQSDEFAU/RQSNOLOG/RQSNOINT/RQSNCLES/RQSLIEN/RQSILIEN/RQSPERE/RQSFILS/RQSMOD4L/RQSLIEN2/RQSQUAL
 
KILLPDP(G) 
 N I,U Q:'($D(@G))
 S I="" F U=0:0 S I=$O(@G@(I)) Q:I=""  Q:I="z"  K @G@(I)
 Q
 
T2 
 S C=@GL3@(M,R,L),J=1
 S:NINJ ^[QUI]RQSMDL3(M,R,L)=C
 F I="R2","L2","QL","QL2" S @I=$P(C,"^",J),J=J+1
 S:L2="" L2="~"_L S:QL="" QL="N" S:QL2="" QL2="N"
 S RI=$$NOMINT^%QSF(R),RI2=$$NOMINT^%QSF(R2)
 S @LLEX@("LIEN",L)="  "_$$^%QZCHW("Lien du schema de donnees")_" "_M
 S @LLEX@("LIEN",L2)="  "_$$^%QZCHW("Lien du schema de donnees")_" "_M
 S ^[QUI]RQSLIEN(RI,L)="3^"_RI2
 S ^[QUI]RQSLIEN(RI2,L2)="3^"_RI
 S ^[QUI]RQSILIEN(RI,RI2,3,L)="3^"_L2
 S ^[QUI]RQSILIEN(RI2,RI,3,L2)="3^"_L
 S ^[QUI]RQSLIEN2(RI,3,L)=RI2
 S ^[QUI]RQSLIEN2(RI2,3,L2)=RI
 D QUAL^%QSMODEL(RI,L,QL,RI2,L2,QL2)
 Q
T3 
 S C=@GL4@(M,R,L),J=1
 S:NINJ ^[QUI]RQSMDL4(M,R,L)=C
 F I="L2","QL","QL2" S @I=$P(C,"^",J),J=J+1
 S:L2="" L2="~"_L S:QL="" QL="N" S:QL2="" QL2="N"
 S RI=$$NOMINT^%QSF(R)
 S @LLEX@("LIEN",L)="  "_$$^%QZCHW("Lien du schema de donnees")_" "_M
 S @LLEX@("LIEN",L2)="  "_$$^%QZCHW("Lien du schema de donnees")_" "_M
 S ^[QUI]RQSLIEN(RI,L)="4^"_RI
 S ^[QUI]RQSLIEN(RI,L2)="5^"_RI
 S ^[QUI]RQSILIEN(RI,RI,4,L)="5^"_L2
 S ^[QUI]RQSILIEN(RI,RI,5,L2)="4^"_L
 S ^[QUI]RQSLIEN2(RI,4,L)=RI
 S ^[QUI]RQSLIEN2(RI,5,L2)=RI
 D QUAL^%QSMODEL(RI,L,QL,RI,L2,QL2)
 Q
 
T1 
 S C=@GL2@(M,R,L),J=1
 S:NINJ ^[QUI]RQSMDL2(M,R,L)=C
 F I="R2","L2","QL","QL2" S @I=$P(C,"^",J),J=J+1
 S:L2="" L2="~"_L S:QL="" QL="N" S:QL2="" QL2="N"
 S RI=$$NOMINT^%QSF(R),RI2=$$NOMINT^%QSF(R2)
 S @LLEX@("LIEN",L)="  "_$$^%QZCHW("Lien du schema de donnees")_" "_M
 S @LLEX@("LIEN",L2)="  "_$$^%QZCHW("Lien du schema de donnees")_" "_M
 S ^[QUI]RQSLIEN(RI,L)="2^"_RI2
 S ^[QUI]RQSLIEN(RI2,L2)="1^"_RI
 S ^[QUI]RQSILIEN(RI,RI2,2,L)="1^"_L2
 S ^[QUI]RQSILIEN(RI2,RI,1,L2)="2^"_L
 S ^[QUI]RQSLIEN2(RI,2,L)=RI2
 S ^[QUI]RQSLIEN2(RI2,1,L2)=RI
 S PERE(RI,R2)=""
 D QUAL^%QSMODEL(RI,L,QL,RI2,L2,QL2)
 Q
 ;

