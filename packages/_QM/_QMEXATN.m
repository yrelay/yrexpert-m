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

;%QMEXATN^INT^1^59547,73878^0
%QMEXATN ;;05:38 PM  11 Feb 1993; 14 Oct 92  5:03 PM ; 22 Nov 93  5:11 PM
 
 
 
 
 N MODECR,REPATN,MOD
 N R,LISTE,LS,LT,CH,LISTE,LRES
 S LISTE=$$TEMP^%SGUTIL,LRES=$$TEMP^%SGUTIL
 S I="" F %I=0:0 S I=$$NXTRI^%QSTRUC8("RESEAU",I) Q:I=""  I $$^%QSCALIN("RESEAU",I,"TYPE.ATN",1)="RESEAU HEVEA" S @LISTE@(I)=""
 D CLEPAG^%VVIDEO,^%VZCD0("COMPREHENSION")
G2 S LS=$$^%QZCHW("Selectionner"),LT=$$^%QZCHW("Tous")
 D POCLEPA^%VVIDEO S CH=$$^%VZECH2("",LS,LT) G:(CH'=LS)&(CH'=LT) FCMP
 
 
 I CH=LT D ANARESO^%QMEXCMP(1,LISTE) G FCMP
 
 D AIDE(0,LISTE,LRES)
 D ANARESO^%QMEXCMP(0,LRES)
 
 K @(LRES)
FCMP K @(LISTE)
 Q
 
 
MAKE(NOMATN) 
 N REP,LIEN,FILE,VU,GLOAT,NOMLIEN,GLOSTO,REPLIEN,NDEP,CTR,Y1,GNODE,INODE,%INODE,NODE,REPATN,ONOTE,%O,TREXPO,TREXPOR
 S REPATN="RESEAU"
 S REP=$$NOMINT^%QSF("ETAT.RESEAU")
 S NDEP=$$^%QSCALIN("RESEAU",NOMATN,"NOEUD.INITIAL",1)
GETNDEP 
 D LIRE2^%VREAD($$^%QZCHW("Noeud initial :"),NDEP,0,78,12,12,"","",.CTR,.NDEP)
 Q:NDEP=""
 I NDEP'="?" G MAKE2
 S GNODE=$$TEMP^%SGUTIL
 S INODE="" F %INODE=0:0 S INODE=$$NXTRIAO^%QSTRUC8(REPATN,NOMATN,"ETAT.RESEAU",INODE) Q:INODE=""  S NODE=$$VALEUR^%QSTRUC8(REPATN,NOMATN,"ETAT.RESEAU",INODE),@GNODE@(NODE)=""
 S NDEP=$$UN^%PKCHOIX(GNODE,10,10,10)
 Q:NDEP=""
MAKE2 I '($$IR^%QSGE5(REP,NOMATN_","_NDEP)) D ^%VZEAVT($$^%QZCHW("Etat inconnu")) G GETNDEP
 D MSG^%VZEATT(NOMATN)
 D PA^%QSGESTI(REPATN,NOMATN,"NOEUD.INITIAL",NDEP,1)
 S NDEP=NOMATN_","_NDEP
 S REP=$$NOMINT^%QSF("ETAT.RESEAU"),LIEN="ETAT.PRECEDE"
 S REPLIEN=$$LIENI^%QSGEL3
 S FILE=$$TEMP^%SGUTIL,VU=$$TEMP^%SGUTIL,NUM=$$TEMP^%SGUTIL
 S GLOAT=$$TEMP^%SGUTIL
 S GLOSTO=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""ATN"")",NOMATN)
 K @(GLOSTO)
 S @GLOSTO@("ENT",1)="REPFOC"
 S @GLOSTO@("ENT",1,"COM")="Repertoire focus :"
 S @GLOSTO@("ENT",2)="INDFOC"
 S @GLOSTO@("ENT",2,"COM")="Individu focus :"
 S IFIL=$$^%QSCALIN(REPATN,NOMATN,"CONTEXTE.D.ACTIVATION","LARGEUR.VISU")
 S TREXPOR=$$^%QSCALIN(REPATN,NOMATN,"CONTEXTE.D.ACTIVATION","TRAITEMENT.EXPOSE")
 S:TREXPOR'="" TREXPOR="TRAITER\"_TREXPOR
 S @GLOSTO@("LVISU")=$S(IFIL="":12,1:IFIL)
 D COMPGEN^%QMEXAT4(NOMATN)
 S @FILE=0
 S @FILE@(@FILE)=NDEP,@NUM@(NDEP)=@FILE
 
 
 D TRT^%QMEXAT5(NDEP,0)
 
 S IFIL=""
BCLPIL S IFIL=$O(@FILE@(IFIL)) G:IFIL="" FIN
 S NUMND=IFIL,ND=@FILE@(IFIL)
 S LIE="",NBLIE=0
BCLLIE S LIE=$$NXTRIAO^%QSTRUC8(REP,ND,LIEN,LIE) G:LIE="" FLIE
 S NBLIE=NBLIE+1
 I $D(@NUM@(LIE)) S @GLOSTO@("T",@NUM@(ND),@NUM@(LIE))="" G LISS
 S @FILE=@FILE+1,@FILE@(@FILE)=LIE,@NUM@(LIE)=@FILE
 S @GLOSTO@("T",NUMND,@NUM@(LIE))=""
 
 
 D TRT^%QMEXAT5(LIE,@NUM@(LIE))
LISS 
 S NOMLIEN=$$NOML1^%QSGES20(ND,LIE,LIEN,LIE) G:NOMLIEN="" BCLLIE
 S VAL=$$^%QSCALIN(REPLIEN,NOMLIEN,"BONUS.UTILISATEUR",1)
 I VAL'="" S @GLOSTO@("RB",@NUM@(ND),@NUM@(LIE))=VAL
 S ICOND="",ICOM=1
BCLLI S ICOND=$$NXTRIAO^%QSTRUC8(REPLIEN,NOMLIEN,"PREDICAT",ICOND)
 G:ICOND="" BCLLIE
 S VAL=$$VALEUR^%QSTRUC8(REPLIEN,NOMLIEN,"PREDICAT",ICOND)
 S @GLOSTO@("T",@NUM@(ND),@NUM@(LIE),ICOM)="X|S ^PARAENT($J,%VNGA+1,""PRD"")="""_VAL_"""",ICOM=ICOM+1
 S @GLOSTO@("T",@NUM@(ND),@NUM@(LIE),ICOM)="X|S ^PARAENT($J,%VNGA+1,""REP"")=^PARAENT($J,%VNGA,""REPFOC"")",ICOM=ICOM+1
 S @GLOSTO@("T",@NUM@(ND),@NUM@(LIE),ICOM)="X|S ^PARAENT($J,%VNGA+1,""IND"")=^PARAENT($J,%VNGA,""INDFOC"")",ICOM=ICOM+1
 
 S @GLOSTO@("T",@NUM@(ND),@NUM@(LIE),ICOM)="D|EVALPRED(%VNGA+1)",ICOM=ICOM+1
 G BCLLI
 
FLIE 
 S TERM=$$^%QSCALIN(REP,ND,"NOEUD.TERMINAL",1)
 S TREXPO=$$^%QSCALIN(REP,ND,"REGLE","EXPOSE")
 I TREXPO="",TREXPOR'="" D PA^%QSGESTI(REP,ND,"REGLE",TREXPOR,"EXPOSE")
 
 S @GLOSTO@("O",NUMND)=$S(TERM'="":TERM,1:0)
 S TERM=$$^%QSCALIN(REP,ND,"NOEUD.DE.PETRI",1)
 S:TERM=1 @GLOSTO@("PETRI",NUMND)=""
 G BCLPIL
FIN D OFF^%VZEATT
 Q
 
LLL 
 Q
 
COMPIL(LCOMPI) 
 N REP,LIEN,FILE,VU,GLOAT,NOMLIEN,GLOSTO,REPLIEN,NDEP,CTR,Y1,GNODE,INODE,%INODE,NODE,REPATN,i,NOMATN
 S REPATN="RESEAU"
 S REP=$$NOMINT^%QSF("ETAT.RESEAU")
 S NOMATN=""
 F i=1:1 S NOMATN=$O(@LCOMPI@(NOMATN)) Q:NOMATN=""  D SUITATN
Q 
SUITATN 
 S NDEP=$$^%QSCALIN("RESEAU",NOMATN,"NOEUD.INITIAL",1)
 Q:NDEP=""
 D MAKE2
 Q
 
 
 
AIDE(NBRE,LISTE,TRES) 
 N TRT,I,%I
 D INIT^%QUCHOIP(LISTE,1,"",0,5,80,17),AFF^%QUCHOIP
 I NBRE'=1 D ^%QUCHOYP(TRES) G FINCHX
 S TRT=$$UN^%QUCHOIP
 S:TRT'="" @TRES@(TRT)=""
FINCHX D END^%QUCHOIP
 Q
 ;

