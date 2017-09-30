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

;%DLLANC2^INT^1^59547,73868^0
DLLANC2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
RETRAIT(REPLA,LANC,POR,DOR) 
 N I,ATDATEJ,DATINT,IIN,ATCHARG,ATMAC,CHARG,MAC,D,MAP,ATDELNEC,NO1,AA
 N PRF,MES,ATDUJ,DUJ,ART
 I VISU S ART=$$^%QSCALVA(REPLA,LANC,$$LIEN1^%QSGEL2(REPLA,$$ART^%DLCON2,3)),MES=$$^%QZCHW("Remise a niveau des charges pour le jalonnement de")_" "_ART D MSG^%VZEATT(MES) S DX=$L(MES)+2
 S MAP=MODEX=2
 S ATDATEJ=$$DATEJAL^%DLCON2
 S ATCHARG=$$CHARGAR^%DLCON2
 S ATMAC=$$MACHINE^%DLCON2
 S ATDELNEC=$$DELNEC^%DLCON2
 S ATDUJ=$$DUJAL^%DLCON2
 K ^RESSOUR($J)
 S NO1=POR-1
BNOPR S NO1=$O(^[QUI]QUERY3(REPLA,LANC,NO1))
 G:NO1="" MOINSR
 G:NO1=DOR MOINSR
 G:NO1'>0 BNOPR
 I VISU X XY W NO1
 S D=$O(^[QUI]QUERY3(REPLA,LANC,NO1,ATDATEJ,""))
 I D'="" D:MAP STATT^%TLBAATT(REPLA,LANC,ATDATEJ,"",NO1,"SUPPRESSION") D PSO^%QSGESTI(REPLA,LANC,ATDATEJ,NO1)
 S PROF=$O(^[QUI]QUERY3(REPLA,LANC,NO1,"PROFONDEUR",""))
 I PROF'="" D:MAP STATT^%TLBAATT(REPLA,LANC,"PROFONDEUR","",NO1,"SUPPRESSION") D PSO^%QSGESTI(REPLA,LANC,"PROFONDEUR",NO1)
 S PREC=$O(^[QUI]QUERY3(REPLA,LANC,NO1,"PRECEDENT",""))
 I PREC>DOR D:MAP STATT^%TLBAATT(REPLA,LANC,"PRECEDENT","",NO1,"SUPPRESSION") D PSO^%QSGESTI(REPLA,LANC,"PRECEDENT",NO1)
 S DUJ=$O(^[QUI]QUERY3(REPLA,LANC,NO1,ATDUJ,""))
 I DUJ'="" D:MAP STATT^%TLBAATT(REPLA,LANC,ATDUJ,"",NO1,"SUPPRESSION") D PSO^%QSGESTI(REPLA,LANC,ATDUJ,NO1)
 S CHARG=$O(^[QUI]QUERY3(REPLA,LANC,NO1,ATCHARG,""))
 G:CHARG="" BORD3
 
 S DEC=$O(^[QUI]QUERY3(REPLA,LANC,NO1,"NB.JOURS.DECALAGE",""))
 I DEC'="" D:MAP STATT^%TLBAATT(REPLA,LANC,"NB.JOURS.DECALAGE","",NO1,"SUPPRESSION") D PSO^%QSGESTI(REPLA,LANC,"NB.JOURS.DECALAGE",NO1)
 D:MAP STATT^%TLBAATT(REPLA,LANC,ATCHARG,"",NO1,"SUPPRESSION")
 D PSO^%QSGESTI(REPLA,LANC,ATCHARG,NO1)
 D:MAP STATT^%TLBAATT(REPLA,LANC,"OPERATION","",NO1,"SUPPRESSION")
 D PSO^%QSGESTI(REPLA,LANC,"OPERATION",NO1)
 S MAC=$O(^[QUI]QUERY3(REPLA,LANC,NO1,ATMAC,""))
 I MAC'="" D:MAP STATT^%TLBAATT(REPLA,LANC,ATMAC,"",NO1,"SUPPRESSION") D PSO^%QSGESTI(REPLA,LANC,ATMAC,NO1)
 D:MAP STATT^%TLBAATT(REPLA,LANC,"NUMERO.OPERATION","",NO1,"SUPPRESSION")
 D PSO^%QSGESTI(REPLA,LANC,"NUMERO.OPERATION",NO1)
 G:(D="")!(MAC="") BNOPR
 S DATINT=$$^%QMDAFFI(D,3)
 K ^[QUI]MACOP(MAC,DATINT,LANC,NO1)
 S ^RESSOUR($J,MAC,DATINT)=$$^%QCAZG("^RESSOUR($J,"""_MAC_""",DATINT)")+CHARG
 G BNOPR
BORD3 
 S AA=$O(^[QUI]QUERY3(REPLA,LANC,NO1,"ARTICLE.JALONNE",""))
 G:AA="" BNOPR
 D:MAP STATT^%TLBAATT(REPLA,LANC,"ARTICLE.JALONNE","",NO1,"SUPPRESSION")
 D PSO^%QSGESTI(REPLA,LANC,"ARTICLE.JALONNE",NO1)
 G BNOPR
 
MOINSR D:MAP STATT^%TLBAATT(REPLA,LANC,ATDELNEC,"","*","SUPPRESSION")
 D PSV^%QSGESTI(REPLA,LANC,ATDELNEC)
 D RETSOU^%DLCAP2
 Q

