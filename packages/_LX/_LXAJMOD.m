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
;! Nomprog     : %LXAJMOD                                                     !
;! Module      : LEXIQUE                                                      !
;! But         : Ajout des mots dans le lexique                               !
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

%LXAJMOD ;
 
 
 
 
 
 
 D CLEPAG^%VVIDEO,^%VAJOUT("LEXIQUE") Q
 
STOC(PRX) 
 S ^[QUI]TOLEX(PRX)="" G STO20
STO2 S:'($D(ABENDSCR)) ABENDSCR=0 Q:ABENDSCR=1  S PRX=RESUL(1)
STO20 D BUILT
 Q
 
 
BUILT N NLEX,YY,FIC,IP,P
 S:'($D(^[QUI]CPTEUR("TOLEX"))) ^[QUI]CPTEUR("TOLEX")=0
 S (NLEX,^[QUI]CPTEUR("TOLEX"))=^[QUI]CPTEUR("TOLEX")+1
 S ^[QUI]PLEX("TOLEX",NLEX)=PRX
 S YY="TOLEX",IP="",P="^[QUI]PLEXP(YY," F I=1:1 S FIC=$P(PRX,".",I) Q:FIC=""  S P=P_""""_FIC_""""_",",IP=""""_FIC_""","_IP Q:FIC=""
 S IP=$E(IP,1,$L(IP)-1),P=$E(P,1,$L(P)-1)_")",@P=NLEX,P="^[QUI]PLEXI(YY,",@(P_IP_")")=NLEX
 Q
 
STO3 S:'($D(^[QUI]CPTEUR("TOLEX"))) ^[QUI]CPTEUR("TOLEX")=1
 S (NLEX,^[QUI]CPTEUR("TOLEX"))=^[QUI]CPTEUR("TOLEX")+1
 S ^[QUI]PLEX("TOLEX",NLEX)=RESUL(1)
 F %GG=1:1 S IT=$P(RESUL(1),".",%GG) Q:IT=""  D ALORS
 Q
ALORS S ^[QUI]PLEXP("TOLEX",%GG,IT,NLEX)=1,^[QUI]PLEXP("TOLEX",%GG,IT)=$S($D(^[QUI]PLEXP("TOLEX",%GG,IT))=11:^[QUI]PLEXP("TOLEX",%GG,IT)+1,1:1),^[QUI]PLEXP("TOLEX",%GG,-1)=$S($D(^[QUI]PLEXP("TOLEX",%GG,-1))=11:^[QUI]PLEXP("TOLEX",%GG,-1)+1,1:1)
 Q
STO4 
 S:'($D(ABENDSCR)) ABENDSCR=0 Q:ABENDSCR=1
 S ^[QUI]TOSYNONY(RESUL(2),RESUL(1))="" Q
 
STO6 
 S:'($D(ABENDSCR)) ABENDSCR=0 Q:ABENDSCR=1
 S ^[QUI]TOUNIT(RESUL(2),RESUL(1))=RESUL(3) Q
 
STO5 S:'($D(ABENDSCR)) ABENDSCR=0 Q:ABENDSCR=1
 S PRX=RESUL(2) D BUILT
 Q
 
STOLEX S:'($D(ABENDSCR)) ABENDSCR=0 Q:ABENDSCR=1  S PRX=RESUL(1)
 D BUILT
 
 G:'($D(^[QUI]TOLEXU(PRX))) STUN
 S PP=$O(^[QUI]TOLEXU(PRX,""))
 K ^[QUI]TOLEXU(PRX)
 K ^[QUI]TOUNIT(PP,PRX)
STUN G:RESUL(7)="" FSTOL
 S ^[QUI]TOLEXU(PRX,RESUL(7))=RESUL(8)_"^"
 S ^[QUI]TOUNIT(RESUL(7),PRX)=RESUL(8)
 
FSTOL K NLEX,YY,FIC,PP,P,PRX
 Q
 
 
 
 
STOCK(MOT,COM1,COM2,COM3,COM4,COM5,UNI,ABUNIT,LSYNO) 
STOCK2 
 N NLEX,PRX,YY,FIC,PP,P,SYNO
 S ^[QUI]TOLEX(MOT)=COM1_"^"_COM2_"^"_COM3_"^"_COM4_"^"_COM5_"^"_UNI_"^"_ABUNIT_"^"
 S PRX=MOT D BUILT
 
 G:UNI="" STOSY
 S ^[QUI]TOLEXU(MOT,UNI)=ABUNIT_"^"
 S ^[QUI]TOUNIT(UNI,MOT)=ABUNIT
 
STOSY Q:LSYNO=""
 S SYNO=""
BSTOSY S SYNO=$O(@LSYNO@(SYNO))
 Q:SYNO=""
 S PRX=SYNO D BUILT
 S ^[QUI]TOSYNONY(SYNO,MOT)=""
 G BSTOSY
 ;

