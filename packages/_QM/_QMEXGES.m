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

;%QMEXGES^INT^1^59547,73878^0
%QMEXGES ;;03:52 PM  6 Aug 1993; ; 15 Jul 93  4:47 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
EXISTE(ATN) 
 N REPATN
 S REPATN="RESEAU"
 Q:'($$IR^%QSGE5(REPATN,ATN)) 0
 Q $$^%QSCALIN(REPATN,ATN,"TYPE.ATN",1)="RESEAU HEVEA"
 
 
 
CM N MODECR,REPATN,MOD
CML D CLEPAG^%VVIDEO,^%VZCD0("MODIFICATION")
 S MOD=$$GET(.MODECR) Q:MOD=""
 D:MODECR ^%VZCD0("MODIFICATION")
 D POCLEPA^%VVIDEO
 D EDITE^%QMEXED(MOD) G CML
 
 
 
CREAT N MODECR,REPATN,MOD,MESGET,VDEF,CTR,Y1
 D CLEPAG^%VVIDEO,^%VZCD0("CREATION")
 S MESGET=$$^%QZCHW("Reseau : "),REPATN="RESEAU"
CR2 D CLFEN^%VVIDEO(0,10,2,78)
 S Y1="",VDEF=""
 D LIRE2^%VREAD(MESGET,VDEF,0,78,10,9,"","",.CTR,.Y1)
 Q:CTR'=""  Q:Y1=""
 S MOD=Y1
 G:'($$IR^%QSGE5(REPATN,MOD)) CR3
 I $$^%QSCALIN(REPATN,MOD,"TYPE.ATN",1)="RESEAU HEVEA" D ^%VZEAVT($$^%QZCHW("Un reseau Hevea de meme nom existe deja")) G CR2
 D ^%VZEAVT($$^%QZCHW("Un ATN de meme nom existe deja")) G CR2
CR3 I $$CREER^%QSGEIND(REPATN,MOD,"",1,.MSG) D ^%VZEAVT($$^%QZCHW("Probleme lors de la creation")) G CR2
 D PA^%QSGESTI(REPATN,MOD,"TYPE.ATN","RESEAU HEVEA",1)
 S MOD=Y1 D EDITE^%QMEXED(MOD) G CR2
 
 
 
DUP N MODECR,REPATN,MOD
 S REPATN=$$REPRESO^%QMEXUTI
 D CLEPAG^%VVIDEO,^%VZCD0("DUPLICATION")
 S MOD=$$GET(.MODECR) Q:MOD=""
 D:MODECR ^%VZCD0("DUPLICATION")
 S MESGET=$$^%QZCHW("Nom de la copie : ")
DU2 D CLFEN^%VVIDEO(0,13,2,78)
 S Y1=""
 D LIRE2^%VREAD(MESGET,"",0,78,13,12,"","",.CTR,.Y1)
 Q:CTR'="" "" I Y1="" Q
 I $$IR^%QSGE5(REPATN,Y1) D ^%VZEAVT($$^%QZCHW("Un reseau Hevea de meme nom existe deja")),POCLEPA^%VVIDEO G DU2
 D COPY^%QMEXCOP(MOD,Y1)
 Q
 
 
 
SUPP N MODECR,REPATN,MOD
 D CLEPAG^%VVIDEO,^%VZCD0("SUPPRESSION")
SUPPL S MOD=$$GET(.MODECR) Q:MOD=""
 D:MODECR ^%VZCD0("SUPPRESSION")
 D POCLEPA^%VVIDEO I '($$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous toujours supprimer ")_MOD_" ? ")) G SUPPL
 D POCLEPA^%VVIDEO
 D ON^%VZEATT
 D SUPPI(MOD),OFF^%VZEATT G SUPPL
 
 
 
SUPPI(ATN) 
 N REPATN,ECRMOD,NOE,%NOE
 S REPATN="RESEAU"
 I $$IR^%QSGE5(REPATN,"compilation."_ATN) D SX^%QSGESTK(REPATN,"compilation."_ATN)
 S NOE="" F %NOE=0:0 S NOE=$$NXTRIAO^%QSTRUC8(REPATN,ATN,"ETAT.RESEAU",NOE) Q:NOE=""  D SUP^%QMEXNOG(NOE)
 D SX^%QSGESTK(REPATN,ATN)
 Q
 
 
 
ACTIV N MODECR,REPATN,MOD,%VNGA,%VNE,%VNG,ETUP
 
 D SET^%SGVAR("CTRLATRT","$$ABAND^%QMEXGES")
 D CLEPAG^%VVIDEO,^%VZCD0("ACTIVATION")
 S MOD=$$GET(.MODECR) Q:MOD=""
 D KVARLOC^%TLIACTI
 I $E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))-1) S ETUP=$$NOUVET^%AMG D SET^%SGVAR("JRN",ETUP),INIT^%AMG(ETUP,"HEVEA",MOD,"","","","")
 S %VNGA=1,%VNE(1,1)=MOD,%VNE(1,3)=$$VISIBLE^%QMEXCAR(MOD)
 D SET^%SGVAR("RESEAU",MOD)
 D GO^%ATNEXE
 D DEP^%SGVAR("CTRLATRT")
 D DEP^%SGVAR("RESEAU")
 I $E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))-1) D DEP^%SGVAR("JRN")
 Q
 
ACTDIR(MOD,REPFOC,INDFOC) 
 N MODECR,REPATN,%VNGA,%VNE,%VNG
 
 D SET^%SGVAR("CTRLATRT","$$ABAND^%QMEXGES")
 D CLEPAG^%VVIDEO
 D KVARLOC^%TLIACTI
 S %VNGA=1,%VNE(1,1)=MOD,%VNE(1,3)=$$VISIBLE^%QMEXCAR(MOD)
 S %VNE(%VNGA,7)=-1,%VNE(%VNGA,2)=$$GEN^%QCAPOP("ATN")
 K ^PARAENT($J)
 S ^PARAENT($J,1,"REPFOC")=REPFOC,^PARAENT($J,1,"INDFOC")=INDFOC
 D GO2^%ATNEXE
 D DEP^%SGVAR("CTRLATRT")
 Q
 
ABAND() N RES,MN,RES,ADRES,ATT
 S RES=0,ATT=^TOZE($I,"ATTENTE") D STANDONE^%VTOZE("ATTENTE")
 S MN=$$TEMP^%SGUTIL
 S @MN="21^10^79"
 S @MN@(1)=$$^%QZCHW("Continuer")_"^ABCONT"
 S @MN@(1,"COM")=$$^%QZCHW("Poursuivre l'execution du traitement")
 S @MN@(2)=$$^%QZCHW("Traitement")_"^ABTRT"
 S @MN@(2,"COM")=$$^%QZCHW("Abandonner l'execution du traitement")
 S @MN@(3)=$$^%QZCHW("Etat")_"^ABETAT"
 S @MN@(3,"COM")=$$^%QZCHW("Abandonner l'execution de toutes les regles sur l'etat courant")
 S @MN@(4)=$$^%QZCHW("Reseau")_"^ABRESO"
 S @MN@(4,"COM")=$$^%QZCHW("Abandonner l'execution du reseau Hevea courant")
 S DX=0,DY=21 D CLEBAS^%VVIDEO
 D ^%VQUIKMN(0,80,22,MN,.ADRES,.CONTR)
 S RES=$S(ADRES="ABTRT":1,ADRES="ABETAT":2,ADRES="ABRESO":3,1:0)
 K @(MN)
 S:'(RES) ^TOZE($I,"ATTENTE")=ATT
 Q RES
 
 
 
 
 
 
 
GET(ECRMOD) N MOD,ZZZ,CONNU,MESGET,Y1,NY1,CTR,VDEF,LATN,LATND,ATN,%A,REPATN
 S ECRMOD=0,ZZZ=0,LATN=$$TEMP^%SGUTIL,LATND=0,REPATN="RESEAU"
 S VDEF=$S($D(^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),1)):^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),1),1:"")
 I VDEF'="",'($$EXISTE(VDEF)) S VDEF=""
 S MESGET=$$^%QZCHW("Reseau : ")
G2 D CLFEN^%VVIDEO(0,10,2,78)
 S Y1=""
 D LIRE2^%VREAD(MESGET,VDEF,0,78,10,9,"","",.CTR,.Y1)
 Q:CTR'="" "" I Y1="" K @(LATN) Q ""
 S CONNU=0 S:Y1="?" Y1=""
 I $$EXISTE(Y1) G G3
 I '(LATND) S LATND=1,ATN="" F %A=0:0 S ATN=$$NXTRI^%QSTRUC8(REPATN,ATN) Q:ATN=""  I $$^%QSCALIN(REPATN,ATN,"TYPE.ATN",1)="RESEAU HEVEA" S @LATN@(ATN)=""
 S NY1=$$SEARCHE^%LXABR(Y1,LATN,.ECRMOD,.CONNU)
 I CONNU=0 D ^%VZEAVT($$^%QZCHW("Reseau inconnu")) G G2
 I NY1="" K @(LATN) Q ""
 I NY1'=Y1 S DX=1,DY=10 X XY W MESGET_NY1 H 5E-1 S Y1=NY1
G3 S ^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),1)=Y1
 K @(LATN)
 Q Y1
 
 
 
ACQUER(VDEF) 
 N MESGET,LATN,REPATN,CONNU,ATN,%A,ECRMOD,LATND
 S REPATN="RESEAU"
 S LATN=$$TEMP^%SGUTIL,LATND=0
 S MESGET=$$^%QZCHW("Reseau : ")
ACQ2 S DX=0,DY=21 D CLEBAS^%VVIDEO
 D LIRE2^%VREAD(MESGET,VDEF,0,78,22,22,"","",.CTR,.Y1)
 Q:CTR'="" ""
 I Y1="" K @(LATN) Q ""
 I Y1="?" G ACQPTI
 I $$IR^%QSGE5(REPATN,Y1) Q:$$^%QSCALIN(REPATN,Y1,"TYPE.ATN",1)="RESEAU HEVEA" Y1 D ^%VZEAVT($$^%QZCHW("Un ATN de meme nom existe deja")) G ACQ2
 I $$CONFIRM^%PKUTIL(10,10,50,$$^%QZCHW("Ce reseau n'existe pas, desirez-vous le creer ?"))'=1 G ACQ2
 I $$CREER^%QSGEIND(REPATN,Y1,"",1,.MSG) D ^%VZEAVT($$^%QZCHW("Probleme lors de la creation")) G ACQ2
 D PA^%QSGESTI(REPATN,Y1,"TYPE.ATN","RESEAU HEVEA",1)
 D CARGEN^%QMEXCAR(Y1,1) K @(LATN) Q Y1
 
ACQPTI I '(LATND) S LATND=1,ATN="" F %A=0:0 S ATN=$$NXTRI^%QSTRUC8(REPATN,ATN) Q:ATN=""  I $$^%QSCALIN(REPATN,ATN,"TYPE.ATN",1)="RESEAU HEVEA" S @LATN@(ATN)=""
 S NY1=$$SEARCHE^%LXABR("",LATN,.ECRMOD,.CONNU)
 I NY1'="" K @(LATN) Q NY1
 G ACQ2
 ;

