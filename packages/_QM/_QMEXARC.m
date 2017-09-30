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

;%QMEXARC^INT^1^59547,73878^0
%QMEXARC ;;05:39 PM  22 Dec 1992; 22 Dec 92 10:40 AM ; 18 Mar 93  8:37 AM
 
 
 
CM N MODECR,REPATN,MOD,FILE1,FILE2,FILE3,CML,L,%IL
CML D CLEPAG^%VVIDEO,^%VZCD0("ARCHIVAGE")
 S MOD=$$GET^%QMEXGES(.MODECR) Q:MOD=""
 D:MODECR ^%VZCD0("ARCHIVAGE")
 D POCLEPA^%VVIDEO
 S FILE1="",FILE2="",FILE3=""
 S R=$$SAISIE^%QMEXAR2(.FILE1,.FILE2,.FILE3,1)
 G:R=0 CML
 D OUT(MOD,FILE1,FILE2,FILE3)
 G CML
 
 
 
OUT(ATN,FILE1,FILE2,FILE3) 
 N LISTE,LISTATT,BASE,GLILA,LPF,LINVO,REPLIEN
 N ENSTRT,ENSPRD,LSAISIE
 D ON^%VZEATT
 S ENSTRT=$$TEMP^%SGUTIL
 S ENSQMD=$$TEMP^%SGUTIL
 S EPRD=$$TEMP^%SGUTIL,ETTL=$$TEMP^%SGUTIL,EMOD=$$TEMP^%SGUTIL,EFOR=$$TEMP^%SGUTIL,ERQS=$$TEMP^%SGUTIL,EPSV=$$TEMP^%SGUTIL,EMSQ=$$TEMP^%SGUTIL
 S LSAISIE=$$TEMP^%SGUTIL
 S BASE="RESEAU",LPF="ETAT.RESEAU",REPNODE="ETAT.RESEAU",LINVO="ETAT.PRECEDE"
 S REPLIEN=$$LIENI^%QSGEL3
 S LISTE=$$GEN^%QCAPOP("LTN"),BASE="RESEAU",LPF="ETAT.RESEAU",REPNODE="ETAT.RESEAU"
 D CREERL^%QS0XG1(LISTE,BASE,"^[QUI]ZLIGTRA("""_LISTE_""")","ARCHIVAGE","RESEAU")
 D PARCO
 S LISTATT=$$GEN^%QCAPOP("LTN")
 S GLILA(1)=LPF,GLILA(2)=LINVO
 D ADD^%QMLILA(LISTATT,"GLILA")
 D MSG($$^%QZCHW("ecriture du fichier")_" "_FILE1)
 S RES=$$ARCHIDON^%SGPDOU(LISTE,LISTATT,4,FILE1,"donnees du reseau "_ATN)
 S L="" F %IL=0:0 S L=$$SUIVL^%QS0XG1(RES,L) Q:L=""  D ELIML^%QS0XG1(L)
 D ELIML^%QS0XG1(RES)
 D ELIML^%QS0XG1(LISTE)
 D DEL^%QMLILA(LISTATT)
 D MSG($$^%QZCHW("ecriture du fichier")_" "_FILE2)
 S PRD="" F %I=0:0 S PRD=$O(@ENSTRT@(PRD)) Q:PRD=""  D TRT^%QULELT1(PRD,ETTL,EMOD,EFOR,ERQS,EPSV)
 S RES=$$FILE^%SGPKOUT(FILE2,ETTL,EMOD,EFOR,ERQS,EPSV,EMSQ,EPRD,1,"connaissances du reseau "_ATN,0,.MES)
 Q:'($D(@LSAISIE))
 D MSG($$^%QZCHW("ecriture du fichier")_" "_FILE3)
 S LISTE=$$GEN^%QCAPOP("LTN"),BASE="SAISIE.I"
 D CREERL^%QS0XG1(LISTE,BASE,"^[QUI]ZLIGTRA("""_LISTE_""")","ARCHIVAGE","RESEAU")
 S PRD="" F %I=0:0 S PRD=$O(@LSAISIE@(PRD)) Q:PRD=""  D AJOUT^%QS0XG1(LISTE,PRD)
 S RES=$$ARCHIDON^%SGPDOU(LISTE,LISTATT,1,FILE3,"saisies du reseau "_ATN)
 D ELIML^%QS0XG1(LISTE)
 D OFF^%VZEATT
 Q
 
 
 
 
 
 
PARCO 
 N FILE,VU,IFILE,NATN
 S FILE=$$TEMP^%SGUTIL,VU=$$TEMP^%SGUTIL
 S @FILE=1,@FILE@(@FILE)=ATN,@VU@(ATN)="",IFILE=""
NXATN S IFILE=$O(@FILE@(IFILE)) G:IFILE="" FPARCO
 S NATN=@FILE@(IFILE)
 D AJOUT^%QS0XG1(LISTE,NATN)
 S INODE=""
NXNODE S INODE=$$NXTRIAO^%QSTRUC8(BASE,NATN,LPF,INODE) G:INODE="" NXATN
 S NODE=NATN_","_$$VALEUR^%QSTRUC8(BASE,NATN,LPF,INODE)
 
 
 
 S IREG=""
NXREG S IREG=$$NXTRIAO^%QSTRUC8(REPNODE,NODE,"REGLE",IREG) G:IREG="" NODE2
 S REG=$$VALEUR^%QSTRUC8(REPNODE,NODE,"REGLE",IREG)
 I $P(REG,"TRAITER\",2)'="" S @ENSTRT@("t."_$P(REG,"TRAITER\",2))="",@ETTL@($P(REG,"TRAITER\",2))="" G NXREG
 I $P(REG,"QUEMANDER\",2)'="" S @LSAISIE@($P(REG,"QUEMANDER\",2))="" G NXREG
 G NXREG
 
NODE2 S ILIEN=""
NODE20 S ILIEN=$$NXTRIAO^%QSTRUC8(REPNODE,NODE,"LIEN."_LINVO,ILIEN) G:ILIEN="" NODE3
 S NOMLIEN=$$VALEUR^%QSTRUC8(REPNODE,NODE,"LIEN."_LINVO,ILIEN)
 
 
 S IREG=""
 F %I=0:0 S IREG=$$NXTRIAO^%QSTRUC8(REPLIEN,NOMLIEN,"PREDICAT",IREG) Q:IREG=""  S @EPRD@($$VALEUR^%QSTRUC8(REPLIEN,NOMLIEN,"PREDICAT",IREG))=""
 G NODE20
 
NODE3 S CXT=$$^%QSCALIN(REPNODE,NODE,"CONTEXTE.D.ACTIVATION",1)
 G:CXT'="REQUETE" NODE4
 S CXT=$$^%QSCALIN(REPNODE,NODE,"CONTEXTE.D.ACTIVATION",2)
 I CXT'="" S @ERQS@(CXT)=""
 
NODE4 G:'($$OAIR^%QSGE5(REPNODE,NODE,"RESEAU.ASSOCIE",1)) NXNODE
 S ATNASSO=$$VALEUR^%QSTRUC8(REPNODE,NODE,"RESEAU.ASSOCIE",1)
 G:'($$IR^%QSGE5(BASE,ATNASSO)) NXNODE
 G:$D(@VU@(ATNASSO)) NXNODE
 S @FILE=@FILE+1
 S @FILE@(@FILE)=ATNASSO
 G NXNODE
 
FPARCO K @(FILE),@(VU) Q
 
MSG(M) D CUROF^%VVIDEO
 D POCLEPA^%VVIDEO S DX=0 X XY W $$BLK^%VVIDEO1_M_$$NORM^%VVIDEO1
 D CURON^%VVIDEO
 Q

