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

;%DLGETJA^INT^1^59547,73868^0
JLGETJA ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
GET(REPAR,LANC,IDAR,GAM,OP,GJALON) 
 D MEM^%QCAMEM
 I '(DTM) K (QUI,WHOIS,TETE,PERE,REPAR,LANC,IDAR,GAM,OP,GJALON,TYPLAN,REPGAM,REPMACH,REPART,FAMTEC) G GET1
 N TEMPEXC
 S TEMPEXC=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"KEXCLU")
 K @(TEMPEXC)
 F I="QUI","WHOIS","TETE","PERE","REPAR","LANC","IDAR","GAM","OP","GJALON","TYPLAN","REPGAM","REPMACH","TEMPEXC","REPART","FAMTEC" S @TEMPEXC@(I)=""
 D KEXMEM^%QCAMEM(TEMPEXC)
 K @(TEMPEXC)
 
GET1 S FT=$$^%QSCALVA(REPAR,IDAR,$$FAMILLE^%DLCON2)
 S:FT="" FT="*"
 S ART=IDAR
 S DEF=$$DEFAUT(FT)
 F U=1:1 Q:'($D(@OP@(U)))
 D INIT^%DLJEVAL(PERE,IDAR,GAM,0,TYPLAN)
 S REPOP=$$OP^%DLCON2
 S NO=U-1
 S COMPO=IDAR_","_GAM
 F U=1:1:NO-1 S M1=@OP@(U,0) I M1'="" S NO1=@OP@(U,1),NOM1=@OP@(U) F V=U+1:1:NO S M2=@OP@(V,0) I M2'="" D ^%DLJVALJ(FT,M1,M2,COMPO_","_@OP@(U),COMPO_","_@OP@(V),.J),MAJ
 D RMEM^%QCAMEM
 Q
 
MAJ 
 
 
 G:'($D(J)) MAJ2
 Q:J=""
 S J=J+0
 S J=J
 G MAJ3
MAJ2 
 
 Q:$P(NO1,".")=$P(@OP@(V,1),".")
 
 
 S J=DEF
MAJ3 S @GJALON@(U,V)=J
 Q
 
 
DEFAUT(FAMTEC) 
 Q:$D(^[QUI]PLJALDEF(FAMTEC)) ^[QUI]PLJALDEF(FAMTEC)+0
 Q:$D(^[QUI]PLJALDEF("*")) ^[QUI]PLJALDEF("*")+0
 Q 0
 ;
 ;

