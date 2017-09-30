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

;TO3NOM1^INT^1^59547,74870^0
TO3NOM1 ;
 
 S NIV=2,VU=0,NOMTREE="^[QUI]TREEWORK(NUFA",ADR="TRAIT^TO3NOM1" D ^%QCAGTU1
 Q
TRAIT D K7 S %N10=0 S:'($D(VU)) VU=1 D GETREF G:(TWREF'=@%TBEV@("%BTW"))&(VU=0) FIN S VU=1,REFUS=0,DATACOUR=@NOM,YA=$P(DATACOUR,"^",1),YB=$P(DATACOUR,"^",2),QT=$P(@NOM,"^",3) I $D(^[QUI]GRAPHE(YA)) S ^EXIGRAPH($I)=1
 D ^TO3PRES Q:$D(^ETUDIE(NUFA,TWREF))  D GFILS,^TO3RPERE S A1=$S(@%TBEV@("%LIA")="?":"EXPL",1:@%TBEV@("%LIA")) G @A1
EXPL D K0 S @%TBEV@("%LIA")="?" D ^TO3AUTEX G:$D(^PHASADM($I,NUFA,"%ABEND",TWREF)) FIN G:%ABEND'=0 PAB1 D:QT["?" TSIMIL G:REFUS=1 FIN D ACQ^TO3EXGET G ABEND:%ABEND=1,FIN:$D(^PHASADM($I,NUFA,"%ABEND",TWREF))
 Q:$D(^ETUDIE(NUFA,TWREF))  D:YA["~" ^TOCHVYB D ^TOPHASUD
IMPL S:'($D(^TIME($J))) ^TIME($J,1)=$H D K1 S @%TBEV@("%LIA")="?" D ^TOIMGET2 G FIN:$D(^PHASADM($I,NUFA,"%ABEND",TWREF)) D:YA["~" ^TOCHVYB G:%ABEND'=0 PAB1
COMP S:'($D(^TIME($J,2))) ^TIME($J,2)=$H D K2 S @%TBEV@("%LIA")="?" D ^TO3GRLAT G:%ABEND'=0 PAB1 D ^TO3GCOMP G:%ABEND'=0 PAB1 D ^TOSITUCP
PHAS S @%TBEV@("%LIA")="?",%TPH="^GLOETUD($I,NUFA,TWREF,""PHAS"",%N10)",%N10=0 D:'(@%TBEV@("%UPH")) TPH^TOTBSBIS D ^TO3PHAS1 G:%ABEND'=0 PAB1
MACH D K3 S @%TBEV@("%LIA")="?",%TPH="^[QUI]GLOETUD(YA,""SELMAC"",%N10)",%N10=0 D:'(@%TBEV@("%UMC")) MAC^TOTBSBIS,FORM^TOTBSBIS D ^TO3ETMAC G:%ABEND'=0 PAB1
FORM D K4 S @%TBEV@("%LIA")="?" D ^TO3NFORM G:%ABEND'=0 PAB1
AUTRF S @%TBEV@("%LIA")="?" D ^TOGAUTRF G:%ABEND'=0 PAB1
DIMO D K5 S @%TBEV@("%LIA")="?" D ^TODIMOUT G:%ABEND'=0 PAB1
OUTC D K6 S @%TBEV@("%LIA")="?" D ^TO3OUTCO G:%ABEND'=0 PAB1 D K6
FIN Q
PAB1 S STOP=1 S:%ABEND=1 TREETUD(NUFA)=$$^%QZCHW("ARRET") G FIN
GETREF S TWREF="" F RR=NIV:1 Q:'($D(B(RR)))  S TWREF=TWREF_B(RR)_","
 S TWREF=$E(TWREF,1,$L(TWREF)-1) G FIN
GFILS S ^NEXSUN($I,TWREF)=$S($D(^NEXSUN($I,TWREF)):^NEXSUN($I,TWREF)+1,1:1)
 G FIN
TSIMIL S NSIM(TWRP)=$S($D(NSIM(TWRP)):NSIM(TWRP)+1,1:1)
 S DX=0,DY=21 D CLEBAS^%VVIDEO S DX=0,DY=21 X XY W $$^%QZCHW("Traitement de "),YB,$$^%QZCHW(" No "),NSIM(TWRP),$$^%QZCHW(" dans "),NOMPERE,$$^%QZCHW("  (CTRLF pour FIN)")
 R *REP D TOUCHE^%INCCLAV(REP,.REP) G:REP=6 REFUS D POCLEPA^%VVIDEO W $$^%QZCHW("  Quantite : ") R QT G:QT=0 REFUS
 S @("^[QUI]TREEWORK(NUFA,"_TWRP_","_^NEXSUN($I,TWRP)_")")=DATACOUR,^[QUI]RAISON(NUFA,TWRP,YA,TWRP_","_^NEXSUN($I,TWRP))=^[QUI]RAISON(NUFA,TWRP,YA,TWREF)
 S ^NEXSUN($I,TWRP)=^NEXSUN($I,TWRP)+1,^V($I,YA,$$^%QZCHW("QUANTITE"))=QTP*QT,^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE"))=QTP*QT,QT=QTP*QT,$P(DATACOUR,"^",3)=QT,@NOM=DATACOUR
SITU S ^PHASADM($I,NUFA,"COMP",$$^%QZCHW("ART"),YB,TWREF)=1,^PHASADM($I,NUFA,"COMP","OK",YB)=TWREF,^PHASADM($I,NUFA,TWRP,"COMP","OK",YB)=TWREF D ^TOSITUCP
 G FIN
REFUS S REFUS=1,DX=0,DY=21 D CLEBAS^%VVIDEO K @("^[QUI]TREEWORK(NUFA,"_TWREF_")"),^[QUI]RAISON(NUFA,TWRP,YA,TWREF) G FIN
ABEND S TRDEL="^[QUI]TREEWORK(NUFA,"_TWREF_")" K @(TRDEL),TRDEL G FIN
K1 Q
 K %APAR,%DAT,%I,%IFLAG,%M,%MODA,PL,PN,TB1,VPA,%PFMAX,%POR,%TB,%U,ACC,C,POSI,TB2,VPD,CP,DATAC,DATACOUR,DATAP,DE,DN,E,FI,QTP,SD,VU,H,HEURE,ISNUM,LH,LYB,M,MSG,REFUS,SL,V,Z1,NAMTAB,NCT,Z2,PARA,PCH,PIM,RR,TAD,VP,ZZ Q
K2 Q
 K TOZEA,TOZEC,TRACE,TT,TYP,UNECR,UNEXP,UNI,VAL,VN,VPA,VU,YF Q
K3 Q
K4 Q
K5 Q
K6 Q
K0 Q
K7 I '(DTM) K (%1DEB,%P0,NUNOD,NEWNODE,F1,DON,VU,%PROGEX,%TREFC,NVIRG,%PR,OUT,%TBEV,NIV,%8DEB,%ABEND,%IFLAG,ADR,B,BATCH,%NUBATCH,NOM,NOMTREE,NUFA,QUI,RM,STOP,SUB,TABEV,TEMPO,TWREF,WHOIS,XART,XY,YA,YB,SUB) G K70
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="%1DEB","%P0","NUNOD","NEWNODE","F1","DON","VU","%PROGEX","%TREFC","NVIRG","%PR","OUT","%TBEV","NIV","%8DEB","%ABEND","%IFLAG","ADR","B","BATCH","%NUBATCH","NOM","NOMTREE","NUFA","QUI","RM","STOP","SUB","TABEV","TEMPO","TWREF","WHOIS","XART","XY","YA","YB","SUB","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
K70 D VARSYS^%QCSAP Q

