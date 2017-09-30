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

;TOP01ETU^INT^1^59547,74873^0
TOP01ETU ;
 
 K ^ETUARC($I),^PARFIX($I),^IDEMARC($I) S %NE=0
BEG S TB="^[QUI]PSRLPARF(ARC)" G:'($D(@TB)) FIN S NF=-1 F %U=1:1 S NF=$N(@TB@(NF)) Q:NF=-1  S RS=@TB@(NF) D T0
FIN Q
T0 S IDT=$P(RS,"^",1) G:IDT="" END D EXI G:NU'=-1 T1 S ART=$P(IDT,":",1) G:ART="" END G:('($D(^[QUI]FULL(ART))))&('($D(^[QUI]ACOMMEB(ART)))) END S %NE=%NE+1,NU=%NE,^ETUARC($I,%NE)=IDT_"^"_ARC
T1 F %V=2:2:12 S %P=$P(RS,"^",%V),%VAL=$P(RS,"^",%V+1) I (%P'="")&(%VAL'="") S ^PARFIX($I,NU,%P)=%VAL
 G END
EXI S NU=-1 F %V=0:0 S NU=$N(^ETUARC($I,NU)) Q:NU=-1  Q:$P(^ETUARC($I,NU),"^",1)=IDT
 G:NU=-1 END S ^IDEMARC($I,ARC)=$P(^ETUARC($I,NU),"^",2)
END Q

