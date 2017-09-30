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

;%PBMHICO^INT^1^59547,73873^0
PTHICOL(X,Y,H,L,LC,E,CL,GLO,FIRST) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N HAUT,HAUT2,%FONC,%9X,%9Y,%9X1,%9X2,%9Y1,%9Y2,%9T,DERNIER,%9O
 I FIRST=1 S %FONC="LANDSCAPE" D ^%PBPZ
 S %9O="HORIZONTALE"
 
 S ^V($J,"%","%ORIENTATION",1)="HORIZONTALE"
 S %9T=1,%FONC="TAILLE" D ^%PBPZ
 D TEXTE
 S COL="",DERNIER=0 D INIT
BOUC S COL=$O(@CL@(COL)) G FIN:COL=""
 S BAS=@CL@(COL,2),HAUT2=0
 I '($D(@CL@(COL,3))) S HAUT=@CL@(COL,1) G IMP
 I @CL@(COL,3)=0 S HAUT=@CL@(COL,1) G IMP
 I @CL@(COL,3)=@CL@(COL,1) S HAUT=@CL@(COL,1)-1,HAUT2=@CL@(COL,3) G IMP
 S HAUT=@CL@(COL,1),HAUT2=@CL@(COL,3)
IMP S %FONC="IMPRESSION.COLONNE" D ^%PBPZ
 G:DERNIER FIN
 G BOUC
 
DER S %9X2=LIM-%9X1
 S %FONC="CADRE" D ^%PBPZ
 S %FONC="HACHURER.FORT" D ^%PBPZ
 G FIN
 
INIT 
 S %9Y1=(Y+H)*75E-2,%9X1=X*254E-3,%9X2=LC*254E-3,LIM=%9X1+(L*254E-3)
 Q
TEXTE 
 D ^%PBMHITX(GLO),CADRE^%PBMHITX(X,Y,L,H,5E-2)
 Q
FIN 
 Q
 
KYO 
 
 I HAUT2=0 G KYO1
 N SAVX,SAVY S SAVX=%9X1,SAVY=%9Y1
 N SAVX2,SAVY2 S SAVX2=%9X2
 S %9EPA=5E-2
 S (%9Y,%9Y1,%9Y2)=SAVY-(HAUT2*75E-2),%9X=%9X1
 S:HAUT2=H (%9Y,%9Y1,%9Y2)=%9Y+1E-1
 S %9X2=%9X+%9X2
 S %FONC="SEGMENT.TEXTE" D ^%PBPZ
 
 S %9Y1=SAVY,%9X1=SAVX
 S %9X2=SAVX2
KYO1 S %9Y2=-(HAUT*75E-2)
 I (%9Y2+(H*75E-2))=0 S %9Y2=%9Y2+1E-1
 
 S:%9Y2<(-(H*75E-2)) %9Y2=(-(H*75E-2))+1E-1
 I ((%9X1+%9X2)+254E-3)>LIM S %9X2=LIM-%9X1,DERNIER=1
 S %FONC="CADRE" D ^%PBPZ
 S %FONC="HACHURER.FORT" D ^%PBPZ
 S %9X1=(%9X1+%9X2)+254E-3
 Q
HPKYO 
 
 I HAUT2=0 G HPKYO1
 N SAVX,SAVY S SAVX=%9X1,SAVY=%9Y1
 N SAVX2,SAVY2 S SAVX2=%9X2
 S %9EPA=5E-2
 S (%9Y,%9Y1,%9Y2)=SAVY-(HAUT2*75E-2),%9X=%9X1
 S:HAUT2=H (%9Y,%9Y1,%9Y2)=%9Y+1E-1
 S %9X2=%9X+%9X2
 S %FONC="SEGMENT.TEXTE" D ^%PBPZ
 
 S %9Y1=SAVY,%9X1=SAVX
 S %9X2=SAVX2
 G HPKYO2
 
HPKYO1 N SAVX,SAVY
HPKYO2 S SAVX=%9X1,SAVY=%9Y1
 S %9Y2=HAUT*75E-2
 I (%9Y2-(H*75E-2))=0 S %9Y2=%9Y2-1E-1
 
 S:%9Y2>(H*75E-2) %9Y2=(H*75E-2)-1E-1
 I ((%9X1+%9X2)+254E-3)>LIM S %9X2=LIM-%9X1,DERNIER=1
 S (%9Y1,%9Y)=%9Y1-%9Y2
 S %9EPA=5E-2
 S %FONC="CADRE" D ^%PBPZ
 S %FONC="HACHURER.FORT" D ^%PBPZ
 S %9X1=SAVX,%9Y1=SAVY
 S (%9X1,%9X)=(%9X1+%9X2)+254E-3
 Q

