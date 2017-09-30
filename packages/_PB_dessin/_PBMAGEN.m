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

;%PBMAGEN^INT^1^59547,73873^0
PTAGENDA ;
 
 
 
 
 
 
FEUIL 
 S %TYPLOGO=1,%COUL=1,%9X=100,%9Y=2880,%9T=6,%Z=5E-1,%LIBEL=1,%INCLIN=1
 
 S %FONC="POLICE.HORIZONTALE" D ^%PBPZ
 D ^%PBMLOM
 S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 S YH=3120-(3120\6),YB=YH-(3120\15E-1),XG=23E-3*4096,XD=4400,DH=(4400-XG)\5
 S %9LXY=XG_","_YH_","_XD_","_YH_","_XD_","_YB_","_XG_","_YB_","_XG_","_YH,%FONC="LIGBRI" D ^%PBPZ
 F I=1:1:4 S %9LXY=(DH*I)+XG,%9LXY=%9LXY_","_YH_","_%9LXY_","_YB D ^%PBPZ
 
 S %9LXY=XG_","_(YB-XG)_","_(XG+(28E-1*DH))_","_(YB-XG)_","_(XG+(28E-1*DH))_","_(XG/3)_","_XG_","_(XG/3)_","_XG_","_(YB-XG) D ^%PBPZ
 S %9LXY=(XG+DH)_","_(YH+(35E-1*XG))_","_(XG+(DH*15E-1))_","_(YH+(35E-1*XG))_","_(XG+(DH*15E-1))_","_(YH+(23E-1*XG))_","_(XG+DH)_","_(YH+(23E-1*XG))_","_(XG+DH)_","_(YH+(35E-1*XG)) D ^%PBPZ
 S %9LXY=((DH*3)+XG)_","_(YB-XG)_","_((DH*5)+XG)_","_(YB-XG)_","_((DH*5)+XG)_","_(XG/3)_","_((DH*3)+XG)_","_(XG/3)_","_((DH*3)+XG)_","_(YB-XG) D ^%PBPZ
 S DH2=(DH*2)\7,DY=(YB-((4*XG)/3))\8
 S DX=10,%FONC="LIGBRI" F I=1:1:6 S %9LXY=(((DH*3)+XG)+(DH2*I))_","_(YB-XG)_","_(((DH*3)+XG)+(DH2*I))_","_(XG/3) D ^%PBPZ
 F I=1:1:7 S %9LXY=((DH*3)+XG)_","_((YB-XG)-(DY*I))_","_((DH*5)+XG)_","_((YB-XG)-(DY*I)) D ^%PBPZ
 
 
 
 S %DESSIN=0
 S %9T=11
 S %FONC="POLICE.HORIZONTALE" D ^%PBPZ
 S %FONC="TAILLE" D ^%PBPZ
 S %FONC="CRAYON",%9TC="FEUTRE",%9CL="ROUGE" D ^%PBPZ
 S %FONC="CONVERSION.X",%9X=(DH+XG)+DX D ^%PBPZ
 S %FONC="CONVERSION.Y",%9Y=((XG*25E-1)+YH)+DX D ^%PBPZ
 S %FONC="TEXT",%9STR="S "_%SEM_%ANN D ^%PBPZ
 
 S %9T=15
 S %FONC="POLICE.HORIZONTALE" D ^%PBPZ
 S %FONC="TAILLE" D ^%PBPZ
 S %FONC="CONVERSION.X",%9X=XG+DX D ^%PBPZ
 S %FONC="CONVERSION.Y",%9Y=(YB-(2*XG))+DX D ^%PBPZ
 S %FONC="TEXT",%9STR="Divers" D ^%PBPZ
 
 S %9Y=YH+(XG*15E-1),%FONC="CONVERSION.Y" D ^%PBPZ
 F I=0:1:4 S %9X=((DH*I)+DX)+XG,%FONC="CONVERSION.X" D ^%PBPZ S %FONC="TEXT",%9STR=$P("Lundi,Mardi,Mercredi,Jeudi,Vendredi",",",I+1) D ^%PBPZ
 
 
 S %NSE=%ANN_%SEM,%DS=$$54^%QMDATE1(%NSE)
 D INT^%DATE
 S %9T=4
 S %FONC="POLICE.HORIZONTALE" D ^%PBPZ
 S %FONC="TAILLE" D ^%PBPZ
 S %9Y=YH+(XG/2),%FONC="CONVERSION.Y" D ^%PBPZ
 F I=0:1:4 S %9X=((DH*I)+DX)+XG,%FONC="CONVERSION.X" D ^%PBPZ S %FONC="TEXT",%9STR=$ZD(%DN),%9STR=$P(%9STR,"/",2)_"/"_$P(%9STR,"/",1) D ^%PBPZ S %DN=%DN+1
 
 S %9T=5
 S %FONC="POLICE.HORIZONTALE" D ^%PBPZ
 S %FONC="TAILLE" D ^%PBPZ
 F I=0:1:7 S %9X=(((DH*3)+XG)+DX)+(DH2*I),%FONC="CONVERSION.X" D ^%PBPZ S %9Y=(YB-XG)+DX,%FONC="CONVERSION.Y" D ^%PBPZ S %9STR=$P("Lun,Mar,Mer,Jeu,Ven,Sam,Dim",",",I+1),%FONC="TEXT" D ^%PBPZ
 S %FONC="CRAYON",%9TC="FEUTRE",%9CL="VERT" D ^%PBPZ
 
 S %NSE=%ANN_%SEM,%DS=$$54^%QMDATE1(%NSE)
 D INT^%DATE
 S %9T=6
 S %FONC="POLICE.HORIZONTALE" D ^%PBPZ
 S %FONC="TAILLE" D ^%PBPZ
 F I=1:1:8 S %9Y=((YB-XG)+DX)-(I*DY),%FONC="CONVERSION.Y" D ^%PBPZ F J=0:1:6 S %9X=(((DH*3)+XG)+(DH2*J))+DX,%FONC="CONVERSION.X" D ^%PBPZ S JO=$ZD(%DN),%9STR=$P(JO,"/",2)_"/"_$P(JO,"/",1),%FONC="TEXT" D ^%PBPZ S %DN=%DN+1
 K DH,DH2,%DN,%DS,DX,DY,I,J,JO,%NSE,%PJO,XD,XG,YB,YH Q
 Q
GO N INCREMENT
 S VALPLA=""
 I '($$^%EDPRLG) G FIN
 
 
 S %FONC="LANDSCAPE" D ^%PBPZ S (%9O,^V($J,"%","%ORIENTATION",1))="HORIZONTALE"
 S %FONC="PRENDRE" D ^%PBPZ
 F INCREMENT=1:1:%NBSEM S:$L(%SEM)=1 %SEM="0"_%SEM D FEUIL S %FONC="CLEAR" D:INCREMENT'=%NBSEM ^%PBPZ S %SEM=%SEM+1 I %SEM=53 S %SEM=1,%ANN=%ANN+1
 D ^%EDEPLG Q
 Q
 
DIAL I '($D(^TABIDENT(WHOIS,"TABTRA"))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Votre ^TABIDENT n'est pas a jour, pb table tracante ... [RETURN]" R *BID G FIN
 I '($D(^TABIDENT(WHOIS,"TYPTAB"))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Votre ^TABIDENT n'est pas a jour, pb table tracante ... [RETURN]" R *BID G FIN
 
 D CLEPAG^%VVIDEO,CAD S %AJCMS="",CMS=0,SCR="PTAGENDA" D ^%VACTISC(SCR) G:ABENDSCR FIN
 S %TERM=^TABIDENT(WHOIS,"TYPTAB"),%PORT=^TABIDENT(WHOIS,"TABTRA")
 S I=1 F V="%SEM","%ANN","%NBSEM" S @V=RESUL(I),I=I+1
 
 
 D GO
 
FIN K ABENDSCR,%ANN,BID,CMS,I,%PORT,RESUL,SCR,%SEM,%TERM,V Q
CAD S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="FEUILLES D'AGENDA" D TO4^%VZCD Q
 
1 S (REFUSE,STOPUC)=0 Q
SQ D ^%VSQUEAK
ERR S (REFUSE,STOPUC)=1
END Q
AFF S DX=^%SCRE(SCR,POS,2),DY=^%SCRE(SCR,POS,3) X XY W ^%SCRE(SCR,POS,1),RESUL(POS) Q
SEM D 1 G:(((RESUL(IC)="")!(RESUL(IC)'?.N))!(RESUL(IC)>53))!(RESUL(IC)<1) SQ
 Q
ANNEE D 1 I RESUL(IC)="" S RESUL(IC)=$P($ZD($H),"/",3),POS=IC D AFF Q
 G:RESUL(IC)'?.N SQ Q
TAB S ^TABIDENT(WHOIS,"TABTRA")="TXB3:"
 S ^TABIDENT(WHOIS,"TYPTAB")="RD-GL2"
 Q
FORMAT(%SEM,%ANN,%NBSEM) 
 S %TERM=^TABIDENT(WHOIS,"TYPTAB"),%PORT=^TABIDENT(WHOIS,"TABTRA")
 N INCREMENT
 S VALPLA=""
 
 S %FONC="LANDSCAPE" D ^%PBPZ S (%9O,^V($J,"%","%ORIENTATION",1))="HORIZONTALE"
 S %FONC="PRENDRE" D ^%PBPZ
 F INCREMENT=1:1:%NBSEM S:$L(%SEM)=1 %SEM="0"_%SEM D FEUIL S %FONC="CLEAR" D:(INCREMENT'=%NBSEM)&(%NBSEM>1) ^%PBPZ S %SEM=%SEM+1 I %SEM=53 S %SEM=1,%ANN=%ANN+1
 Q

