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

;%QFINIT2^INT^1^59547,73875^0
GRINIT2(LISTE,LLISTEN) 
 
 
 
 
 
 
 
 
 N CH,NOMS,NUFA,RES1,RES2,RES3,RES4,RES5,RES6,SCR,U
 S NUFA=$J K ^[QUI]GROUPE(NUFA)
 D CADRE^%QFSELIS,LISTE
 G ABAND:'($$GRILLE)
 D TRI,INIT
 S MSG=$$^%QFINIT3(NUFA,LISTE,LLISTEN,^ATTR($J,"O",6))
 I MSG'="" D ^%VZEAVT(MSG) Q 0
 D GO
 G FIN
 
FIN 
 Q 1
ABAND 
 Q 0
GRILLE() 
 S SCR="QGINIT",NOMTAB=" ",CMS=0 F U=1:1:^%SCRE(SCR) S RESUL(U)="",PATOUCH(U)="",DEJALU(U)=""
 D BEG^%VAFIGRI,^%VAFISCR,^%VMODISC Q:ABENDSCR 0
 F U=1:1:^%SCRE(SCR) S CH="RES"_U,@CH=RESUL(U)
 S GRAT="" F NA=1:1:6 S RTTA=@("RES"_NA),^ATTR($J,"O",NA)=RTTA,GRAT=GRAT_RTTA_"^"
 S ^[QUI]GRATT(NUFA)=GRAT K GRAT,NA S ^ATTR($J,"O",0)="AFFECTATION"
 I RES6="" S ATAFG="CARDINAL"
 E  S ATTR=RES6,ATAFG="SOMME.DES."_RES6
 S (^[QUI]GRATT(NUFA,"G",ATAFG),^[QUI]GRATT(NUFA,"G","CARDINAL"))=""
 Q 1
 
INIT S NUFA=$J,NOUVATT=1,NOUVETU=1
 S ^[QUI]GROUPE(NUFA,1)=""
 S NOMS="^INDIVIDU^INDIVIDUS^M^LOT^LOTS^M"
 S (%NIND,%nind)=$P(NOMS,"^",2),(%NINDS,%ninds)=$P(NOMS,"^",3),(%NGRO,%ngro)=$P(NOMS,"^",5),(%NGROS,%ngros)=$P(NOMS,"^",6),(%EI,%ei)=$S($P(NOMS,"^",4)="F":"E",1:""),%EG=$S($P(NOMS,"^",7)="F":"E",1:""),%eg=$S(%EG="E":"e",1:"")
 K NOMS
 Q
 
LISTE 
 N CARD,IND,U,BASE S NUFA=$J
 D MSG^%VZEATT("Constitution de la liste initiale...")
 S CARD=0,LI=-1 F U=0:0 S LI=$N(@LISTE@(LI)) Q:LI=-1  S AD=$$^%QSCALVA("L0",LI,"ADRESSE"),BASE=$$^%QSCALVA("L0",LI,"BASE") I BASE'="" S IND=-1 F U=0:0 S IND=$N(@AD@(IND)) Q:IND=-1  I $$IR^%QSGE5(BASE,IND) S ^[QUI]GRLISTE(NUFA,IND)=BASE,CARD=CARD+1
 S ^[QUI]GROUPE(NUFA,"CARD")=CARD
 D ^%VSQUEAK S DX=0,DY=3 X XY W "Nombre d'individus presents parmi les listes selectionnees : "_$$BLD^%VVIDEO1_CARD_$$NORM^%VVIDEO1
 D POCLEPA^%VVIDEO
 Q
TRI D ^%QFTRILI,POCLEPA^%VVIDEO
 Q
 
GO 
 S ZOOM=0,ATAF=1,ARRET="FIN",COTE="",AFFLIST=1 K ^PAG($J),^PAD($J) D CLEPAG^%VVIDEO,ENTETE^%QFECRAN,CADRE^%QFECRAN,CREPAG^%QFPAG,APG^%QFPAG,CREPAD^%QFPAG,TOUT^%QFEVASG,APD^%QFPAG
 S (CTRLF,CTRLA)=0 Q
 
AFF D CLEPAG^%VVIDEO,ENTETE^%QFECRAN,CADRE^%QFECRAN,APG^%QFPAG,CREPAD^%QFPAG,APD^%QFPAG
 Q

